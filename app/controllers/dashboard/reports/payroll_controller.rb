module Dashboard::Reports
  class PayrollController < Dashboard::ReportsController

    before_filter do
      @agency = current_user.agency
    end

    def index

    end

    # GET /dashboard/reports/payroll/batch
    def new_batch
      @batch = PayrollBatch.new
      @visit_ids = (params[:visit].empty?) ? [] : params[:visit]
      @visits = Visit.where(:id => params[:visit])
    end

    # POST /dashboard/reports/payroll/batch
    def create_batch
      @batch = PayrollBatch.new params[:visit]

      @visit_ids = params[:visits].split(',')
      @visit_ids.each do |id|
        line_item = PayrollLineItem.create_from_visit! Visit.find(id)
        @batch.payroll_line_items << line_item
      end

      if @batch.save!
        redirect_to dashboard_reports_payroll_batches_path
      end

    end


    def unbatched
      @visits = @agency.unbatched_visits
    end

    def batches
      @batches  = @agency.payroll_batches
    end

  end
end
