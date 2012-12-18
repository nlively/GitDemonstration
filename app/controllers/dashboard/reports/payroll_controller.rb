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
      visit_ids = (params[:visit].empty?) ? [] : params[:visit]
      @visits = Visit.where(:id => params[:visit])
    end

    # POST /dashboard/reports/payroll/batch
    def create_batch

    end


    def unbatched
      @visits = @agency.unbatched_visits
    end

    def batches
      @batches  = @agency.payroll_batches
    end

  end
end
