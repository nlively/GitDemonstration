module Dashboard::Reports
  class PayrollController < Dashboard::ReportsController
    include PayrollHelper

    before_filter do
      @agency = current_user.agency
    end

    def index

      @start = (params[:start].blank?) ? Date.today.beginning_of_month : Date.strptime(params[:start], '%m/%d/%Y')
      @stop = (params[:stop].blank?) ? DateTime.current : (Date.strptime(params[:stop], '%m/%d/%Y') + 1.day - 1.second)

    end

    def unbatched
      @visits = @agency.unbatched_visits
    end

    def batches
      @batches  = @agency.payroll_batches
    end

  end
end
