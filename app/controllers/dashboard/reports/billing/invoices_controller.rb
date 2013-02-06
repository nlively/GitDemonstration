module Dashboard::Reports::Billing
  class InvoicesController < Dashboard::Reports::BillingController
    include PayrollAndBillingHelper
    include ApplicationHelper
    include ActionView::Helpers::NumberHelper

    # GET /dashboard/reports/billing/invoices
    def index
      @page_title = 'Search Invoices'

      @client_name = (params[:client_name] or '')
      @invoice_number = (params[:invoice_number] or '')
      @invoice_date = (params[:invoice_date] or '')
      @invoice_status = (params[:invoice_status] or '')

      @filter_options = {
        :client_name => 'Client name',
        :invoice_number => 'Invoice number',
        :invoice_date => 'Invoice date',
        :invoice_status => 'Invoice status'
      }

      unless @invoice_date.blank?
        @invoice_date = Date.strptime(@invoice_date, '%m/%d/%Y')
      end

      @status_options = invoice_statuses

      options = {
        :client_name => @client_name,
        :invoice_number => @invoice_number,
        :invoice_date => @invoice_date,
        :invoice_status => @invoice_status
      }

      @invoices = @agency.client_invoices_query(options).order('invoice_number DESC')


    end

    # POST /dashboard/reports/billing/invoices/search
    def search
      index
    end

    def edit
      @invoice = ClientInvoice.find params[:id]
    end

    # GET /dashboard/reports/billing/invoices/new
    def new
      @page_title = 'Create Invoices'
      @start = (params[:start].blank?) ? Date.today.beginning_of_month : Date.strptime(params[:start], '%m/%d/%Y')
      @stop = (params[:stop].blank?) ? DateTime.current : (Date.strptime(params[:stop], '%m/%d/%Y') + 1.day - 1.second)
    end

    # POST /dashboard/reports/billing/invoices
    def create

      unless params[:start].blank? or params[:stop].blank?

        @start = Date.strptime(params[:start], '%m/%d/%Y')
        @stop  = Date.strptime(params[:stop], '%m/%d/%Y') + 1.day - 1.second


        @batch = ClientInvoiceBatch.create! :agency_id => @agency.id, :start_date => @start, :end_date => @stop

        @visits = @agency.unbilled_visits_by_date_range @start, @stop
        @visits.sort_by! { |e| e.in_time }

        @clients = {}
        @invoices = []

        @visits.each do |v|
          @clients[v.care_recipient_id] = {:visits =>[]} if @clients[v.care_recipient_id].blank?
          @clients[v.care_recipient_id][:visits] << v
        end

        invoice_number = @agency.latest_invoice_number + 1

        @clients.each do |id, data|
          care_recipient = CareRecipient.find id
          calculations = calculate_overtime_from_visits data[:visits]
          @clients[id][:care_recipient] = care_recipient
          @clients[id][:calculations] = calculations


          invoice = ClientInvoice.create! :status => :temporary, :client_invoice_batch_id => @batch.id, :agency_id => @agency.id, :care_recipient_id => id, :invoice_date => Date.today, :due_date => Date.today, :invoice_number => invoice_number


          data[:visits].each do |v|
            visit = Visit.find v.id

            line_item = ClientInvoiceLineItem.create!({
              :visit_id => v.id,
              :client_invoice => invoice,
              :care_recipient_id => id,
              :hours => visit.total_hours,
              :bill_rate => visit.bill_rate,
              :original_bill_rate => visit.bill_rate,
              :adjustments => 0.0
            })
            invoice.client_invoice_line_items << line_item

          end

          @invoices << invoice
          invoice_number += 1

        end

        redirect_to dashboard_reports_billing_pending_invoices_path(:guid => @batch.guid)

      end

    end

    # GET /dashboard/reports/billing/invoices/pending/:guid
    def pending
      @page_title = 'Create Invoices'
      @batch = ClientInvoiceBatch.find_by_guid params[:guid]
    end

    # POST /dashboard/reports/billing/invoices/export
    def export
      @page_title = 'Save and Export Invoices'
      @guid = params[:batch]
      @count = params[:export].count
      session[:export_ids] = params[:export]
    end

    # GET /dashboard/reports/billing/invoices/export/batch/:guid
    def export_batch
          require 'rubygems'
          require 'zip/zip'

          @batch = ClientInvoiceBatch.find_by_guid params[:guid]

          dirname = "#{Rails.root}/tmp" #temp_dir

          @paths = []

          @batch.client_invoices.each do |invoice|
            if session[:export_ids].include? invoice.id.to_s
              logger.debug "Exporting invoice " + invoice.id.to_s
              # do the export
              path = dirname + '/' + invoice.filename + '.csv'
              @paths << {:full_path => invoice.export!(path), :file_name => invoice.filename + '.csv' }
            else
              logger.debug "Backing out of invoice " + invoice.id.to_s
              invoice.back_out!
            end
          end

          zip_file_name = "invoices.zip"
          t = Tempfile.new("#{dirname}/#{@batch.guid}.zip")
          Zip::ZipOutputStream.open(t.path) do |z|
            @paths.each do |path|
              z.put_next_entry(path[:file_name])
              z.print IO.read(path[:full_path])
            end
          end
          send_file t.path, :type => 'application/zip',
            :disposition => 'attachment',
            :filename => zip_file_name
          t.close

        end

    # GET /dashboard/reports/billing/invoices/export/:id
    def export_individual
      @invoice = ClientInvoice.find params[:id]

      dirname = "#{Rails.root}/tmp" #temp_dir

      path = dirname + '/' + @invoice.filename + '.csv'
      @invoice.export!(path)

      send_file path, :type => 'text/csv',
              :disposition => 'attachment',
              :filename => @invoice.filename + '.csv'

    end


    # POST /dashboard/reports/billing/invoices/:id/status
    def status
      @invoice = ClientInvoice.find params[:id]
      unless params[:status].blank?
        @invoice.status = params[:status]
        @invoice.save!

      end
    end

    # GET /dashboard/reports/billing/invoices/:id
    def show
      @invoice = ClientInvoice.find params[:id]
      @page_title = 'Invoice ' + @invoice.invoice_number_formatted + ' (' + @invoice.care_recipient.full_name + ')'
    end

    # POST /dashboard/reports/billing/invoices/:id
    def update
      @invoice = ClientInvoice.find params[:id]

      if @invoice.update_attributes! params[:client_invoice]
        redirect_to dashboard_reports_billing_pending_invoices_path(:guid => params[:batch]), notice: 'Invoice was successfully updated.'
      else
        redirect_to dashboard_reports_billing_pending_invoices_path(:guid => params[:batch])
      end


    end

    # DELETE /dashboard/reports/billing/invoices/:id
    def destroy
      @invoice = ClientInvoice.find params[:id]
      @invoice.back_out!

      redirect_to dashboard_reports_billing_invoices_path
    end

  end
end
