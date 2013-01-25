module Dashboard
  class VisitsController  < DashboardController


    def fetch_visits
      @completed = @agency.completed_visits_by_date_range @start, @stop
      @pending = @agency.pending_visits_by_date_range @start, @stop
    end

    def custom
      @start = (params[:start].blank?) ? Date.today.beginning_of_month : Date.strptime(params[:start], '%m/%d/%Y')
      @stop = (params[:stop].blank?) ? DateTime.current : (Date.strptime(params[:stop], '%m/%d/%Y') + 1.day - 1.second)
      fetch_visits
    end

    def index
      #@start = (params[:start].blank?) ? Date.today.beginning_of_month : Date.strptime(params[:start], '%m/%d/%Y')
      #@stop = (params[:stop].blank?) ? DateTime.current : (Date.strptime(params[:stop], '%m/%d/%Y') + 1.day - 1.second)
      #fetch_visits
      redirect_to dashboard_visits_today_path
    end

    def today
      @start = Date.today.to_datetime
      @stop = @start + 1.day - 1.second
      fetch_visits
    end

    def this_week
      @start_of_week = Date.today.beginning_of_week :sunday
      @end_of_week = @start_of_week.end_of_week :sunday


      unless params[:day].blank?
        @current = Date.parse(params[:day]) unless params[:day].blank?
        @current_visits = @agency.completed_visits_by_date_range @current, @current + 1.day
      end

      @visits_by_week = @agency.unapproved_visits_by_week @start_of_week


      @days = {}

      (0..6).each do |offset|
        date = @start_of_week + offset.days
        @days[date] = 0
      end

      @visits_by_week.each do |visit|
        day = visit.in_time.beginning_of_day.to_date
        @days[day] += 1
      end

    end

    def this_month
      @start_of_month = Date.today.beginning_of_month
      @end_of_month = @start_of_month.end_of_month

      @earliest_date_available = @start_of_month - 2.months
      days_back = (@start_of_month -  @earliest_date_available).to_i

      @start = Date.today.beginning_of_month
      @stop = DateTime.current


      unless params[:day].blank?
        @current = Date.parse(params[:day]) unless params[:day].blank?
        @current_visits = @agency.completed_visits_by_date_range @current, @current + 1.day
      end

      @visits_by_month = @agency.unapproved_visits_by_date_range @earliest_date_available, @end_of_month


      @days = {}


      ((0-days_back)..(@end_of_month.day-1)).each do |offset|
        date = @start_of_month + offset.days
        @days[date] = 0
      end


      @visits_by_month.each do |visit|
        day = visit.in_time.beginning_of_day.to_date
        @days[day] += 1
      end


      logger.debug @days.inspect


    end


    # GET /dashboard/visits/:id
    def show
      @visit = Visit.find params[:id]
      @type = @visit.type
    end

    # GET /dashboard/visits/:id/edit
    def edit
      @visit = Visit.find params[:id]
      @type = params[:type]
    end

    # POST /dashboard/visits/:id/approve
    def approve
      @visit = Visit.find params[:id]
      @type = @visit.type

      @visit.update_attributes :approved => true
    end

    # PUT /dashboard/visits/:id
    def update
      @visit = Visit.find params[:id]
      @type = params[:type]

      if @visit.update_attributes(params[:visit])
        render
      end

    end


  end
end