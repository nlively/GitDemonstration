module Dashboard::Reports::Payroll
  class BatchesController < Dashboard::Reports::PayrollController
    include PayrollAndBillingHelper
    include ApplicationHelper
    include ActionView::Helpers::NumberHelper

    # POST /dashboard/reports/payroll/batches/search
    def search
      index
    end

    # GET /dashboard/reports/payroll/batches
    def index
      @page_title = 'Search Payroll Batches'

      @employee_id = (params[:employee_id] or '')
      @employee_name = (params[:employee_name] or '')
      @batch_number = (params[:batch_number] or '')
      @batch_date = (params[:batch_date] or '')
      @batch_status = (params[:batch_status] or '')

      @filter_options = {
        #:employee_id => 'Employee ID',      # This one is a silent option
        :employee_name => 'Employee name',
        :batch_number => 'Batch number',
        :batch_date => 'Batch date',
        :batch_status => 'Batch status'
      }

      unless @batch_date.blank?
        @batch_date = Date.strptime(@batch_date, '%m/%d/%Y')
      end

      @status_options = batch_statuses

      options = {
        :employee_id => @employee_id,
        :employee_name => @employee_name,
        :batch_number => @batch_number,
        :batch_date => @batch_date,
        :batch_status => @batch_status
      }
      @batches = @agency.payroll_batches_query(options)

    end

    # GET /dashboard/reports/payroll/batches/new
    def new
      @page_title = 'Create Payroll Batch'

      @start = (params[:start].blank?) ? Date.today.beginning_of_month : Date.strptime(params[:start], '%m/%d/%Y')
      @stop = (params[:stop].blank?) ? DateTime.current : (Date.strptime(params[:stop], '%m/%d/%Y') + 1.day - 1.second)
    end

    # POST /dashboard/reports/payroll/batches
    def create


      unless params[:start].blank? or params[:stop].blank?

        @start =  Date.strptime(params[:start], '%m/%d/%Y')
        @stop =  (Date.strptime(params[:stop], '%m/%d/%Y') + 1.day - 1.second)

        @batch = PayrollBatch.create! :agency_id =>@agency.id, :period_start => @start, :period_end => @stop, :batch_date =>DateTime.current, :status => 'temporary'


        @visits = @agency.unbatched_visits_by_date_range @start, @stop
        @visits.sort_by! { |e| e.in_time }

        @visits_by_employee = {}
        @visits.each do |v|
          @visits_by_employee[v.user_id] = {:visits =>[]} if @visits_by_employee[v.user_id].blank?
          @visits_by_employee[v.user_id][:visits] << v
        end

        @visits_by_employee.each do |id, data|
          employee = User.find id
          calculations = calculate_overtime_from_visits data[:visits]
          @visits_by_employee[id][:employee] = employee
          @visits_by_employee[id][:calculations] = calculations

          line_item = PayrollLineItem.create!({
            :payroll_batch_id => @batch.id,
            :status => :temporary,
            :user_id => id,
            :regular_hours_worked => calculations['totals'][:normal_hours],
            :overtime_hours_worked =>calculations['totals'][:overtime_hours],
            :pay_rate => employee.default_pay_rate,
            :overtime_rate => employee.default_overtime_rate
          })
          @batch.payroll_line_items << line_item

          data[:visits].each do |visit|
            visit.temp_payroll_line_item_id=line_item.id
            visit.save!
          end

        end

        if @batch.save!
          redirect_to dashboard_reports_payroll_batch_path(@batch)
        end

      end

    end

    # GET /dashboard/reports/payroll/batches/:id
    def show
      @batch = PayrollBatch.find params[:id]
      @batches = @agency.payroll_batches
      @page_title = 'Payroll Batch ' + @batch.batch_number
    end

    # POST /dashboard/reports/payroll/batches/:id
    def update
      @batch = PayrollBatch.find params[:id]
    end

    # DELETE /dashboard/reports/payroll/batches/:id
    def destroy
      @batch = PayrollBatch.find params[:id]
      @batch.back_out!

      redirect_to dashboard_reports_payroll_batches_path
    end

    # POST /dashboard/reports/payroll/batches/export/:id
    def export
      @page_title = 'Save and Export Payroll Batch'
      @batch = PayrollBatch.find params[:id]

      @batch.status = :pending

      @count = params[:export].count
      session[:export_ids] = params[:export]

      if params[:pending] == '1'
        @batch.payroll_line_items.each do |li|
          if params[:export].include? li.id
            li.status = :saved
          else
            li.back_out!
          end
        end

        @batch.save!
      end

    end


    # GET /dashboard/reports/payroll/batches/export/:id/download
    def export_download
      dirname = "#{Rails.root}/tmp"
      @batch = PayrollBatch.find params[:id]

      zip_file_name = @batch.export! dirname
      #redirect_to '/dashboard/reports/payroll/batches/' + @batch.id.to_s
      send_file zip_file_name, :type => 'application/zip',
        :disposition => 'attachment',
        :filename => @batch.filename + '.zip'
    end

    # POST /dashboard/reports/payroll/batches/:id/status
    def status

    end

    # GET /dashboard/reports/payroll/batches/:id/line-item/:line_item_id
    def line_item
      @line_item = PayrollLineItem.find params[:line_item_id]


      @page_title = 'Payroll Batch ' + @line_item.payroll_batch.batch_number + ' - ' + @line_item.user.full_name

    end

    # PUT /dashboard/reports/payroll/batches/:id/line-item/:line_item_id
    def update_line_item
      @line_item = PayrollLineItem.find params[:line_item_id]

      if @line_item.update_attributes! params[:payroll_line_item]
        redirect_to dashboard_reports_payroll_batch_path(@line_item.payroll_batch), notice: 'Payroll line item was successfully updated.'
      else
        redirect_to dashboard_reports_payroll_batch_path(@line_item.payroll_batch)
      end
    end


  end
end
