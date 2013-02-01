module Dashboard::Reports::Billing
  class InvoicesController < Dashboard::Reports::BillingController
    include PayrollAndBillingHelper
    include ActionView::Helpers::NumberHelper

    # GET /dashboard/reports/billing/invoices
    def index

      @start = (params[:start].blank?) ? Date.today.beginning_of_month : Date.strptime(params[:start], '%m/%d/%Y')
      @stop = (params[:stop].blank?) ? DateTime.current : (Date.strptime(params[:stop], '%m/%d/%Y') + 1.day - 1.second)

    end

    # GET /dashboard/reports/billing/invoices/search
    def search

      @start = (params[:start].blank?) ? Date.today.beginning_of_month : Date.strptime(params[:start], '%m/%d/%Y')
      @stop = (params[:stop].blank?) ? DateTime.current : (Date.strptime(params[:stop], '%m/%d/%Y') + 1.day - 1.second)

    end

    # POST /dashboard/reports/billing/invoices
    def create

      unless params[:start].blank? or params[:stop].blank?

        @start = Date.strptime(params[:start], '%m/%d/%Y')
        @stop  = Date.strptime(params[:stop], '%m/%d/%Y') + 1.day - 1.second

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


          invoice = ClientInvoice.create! :agency_id => @agency.id, :care_recipient_id => id, :invoice_date => Date.today, :due_date => Date.today, :invoice_number => invoice_number


          data[:visits].each do |visit|

            line_item = ClientInvoiceLineItem.create!({
              :client_invoice => invoice,
              :care_recipient_id => id,
              :hours => visit.total_hours,
              :bill_rate => visit.bill_rate,
              :original_bill_rate => visit.bill_rate,
              :adjustments => 0.0
            })
            invoice.client_invoice_line_items << line_item

            visit.client_invoice_line_item_id=line_item.id
            visit.save!
          end

          @invoices << invoice
          invoice_number += 1

        end

        redirect_to dashboard_reports_billing_invoices_pending_path(:start => @start.to_formatted_s(:mdy), :stop => @stop.to_formatted_s(:mdy))

      end

    end



    def pending
      if params[:start].blank? or params[:stop].blank?
        @pending_invoices = @agency.pending_invoices
      else
        @start = Date.strptime(params[:start], '%m/%d/%Y')
        @stop = (Date.strptime(params[:stop], '%m/%d/%Y') + 1.day - 1.second)

        @invoice_total = 0.00

        @pending_invoices = @agency.pending_invoices.where('invoice_date BETWEEN ? AND ?', @start, @stop)
        @pending_invoices.each do |invoice|
          @invoice_total += invoice.total_amount
        end

        @invoice_total_formatted = number_to_currency( @invoice_total, :unit => "$", :precision => 2 )
      end

    end

    def save_pending

    end

    def cancel_pending

    end


    # GET /dashboard/reports/billing/invoices/:id
    def show
      @invoice = ClientInvoice.find params[:id]
    end

    # POST /dashboard/reports/billing/invoices/:id
    def update
      @invoice = ClientInvoice.find params[:id]
    end

    # DELETE /dashboard/reports/billing/invoices/:id
    def destroy
      @invoice = ClientInvoice.find params[:id]
      @invoice.back_out!

      redirect_to dashboard_reports_billing_invoices_path
    end

  end
end
