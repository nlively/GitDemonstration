module Dashboard::Reports
  class PayrollController < Dashboard::ReportsController
    include PayrollHelper

    before_filter do
      @agency = current_user.agency
    end

    def index

      @start = (params[:start].blank?) ? Date.today.beginning_of_month : Date.strptime(params[:start], '%m/%d/%Y')
      @stop = (params[:stop].blank?) ? DateTime.current : (Date.strptime(params[:stop], '%m/%d/%Y') + 1.day - 1.second)

      a = Agency.find 1
      @visits = a.approved_visits_by_date_range @start, @stop
      @visits.sort_by! { |e| e.in_time }

      @calculated = calculate_overtime_from_visits @visits

      @weeks = weeks_spanned_by_range @visits

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
