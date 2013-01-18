module Dashboard::Reports::Billing
  class BatchesController < Dashboard::Reports::BillingController
    include PayrollAndBillingHelper

    # GET /dashboard/reports/billing/batches
    def index

      @start = (params[:start].blank?) ? Date.today.beginning_of_month : Date.strptime(params[:start], '%m/%d/%Y')
      @stop = (params[:stop].blank?) ? DateTime.current : (Date.strptime(params[:stop], '%m/%d/%Y') + 1.day - 1.second)

      @batches = @agency.billing_batches

    end

    # GET /dashboard/reports/billing/batches/new
    def new
      @batch = BillingBatch.new
      @visit_ids = (params[:visit].empty?) ? [] : params[:visit]
      @visits = Visit.where(:id => params[:visit])
    end

    # POST /dashboard/reports/billing/batches
    def create

      @start = (params[:start].blank?) ? Date.today.beginning_of_month : Date.strptime(params[:start], '%m/%d/%Y')
      @stop = (params[:stop].blank?) ? DateTime.current : (Date.strptime(params[:stop], '%m/%d/%Y') + 1.day - 1.second)

      @batch = BillingBatch.create! :agency_id =>@agency.id, :period_start => @start, :period_end => @stop, :batch_date =>DateTime.current


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

        line_item = BillingLineItem.create!({
          :billing_batch_id => @batch.id,
          :user_id => id,
          :hours => calculations['totals'][:normal_hours],
          :overtime_hours_worked =>calculations['totals'][:overtime_hours],
          :pay_rate => employee.default_pay_rate,
          :overtime_rate => employee.default_overtime_rate,
          :adjustments => 0.0
        })
        @batch.billing_line_items << line_item

        data[:visits].each do |visit|
          visit.billing_line_item_id=line_item.id
          visit.save!
        end

      end

      if @batch.save!
        redirect_to dashboard_reports_billing_batch_path(@batch)
      end

    end

    # GET /dashboard/reports/billing/batches/:id
    def show
      @batch = BillingBatch.find params[:id]
      @batches = @agency.billing_batches
    end

    # POST /dashboard/reports/billing/batches/:id
    def update
      @batch = BillingBatch.find params[:id]
    end

    # DELETE /dashboard/reports/billing/batches/:id
    def destroy
      @batch = BillingBatch.find params[:id]
      @batch.back_out!

      redirect_to dashboard_reports_billing_batches_path
    end

  end
end
