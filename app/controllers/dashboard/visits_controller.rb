module Dashboard
  class VisitsController  < DashboardController


    def fetch_visits
      @completed = @agency.completed_visits_by_date_range @start, @stop
      @pending = @agency.pending_visits_by_date_range @start, @stop
    end

    def custom
      index
    end

    def index
      @start = (params[:start].blank?) ? Date.today.beginning_of_month : Date.strptime(params[:start], '%m/%d/%Y')
      @stop = (params[:stop].blank?) ? DateTime.current : (Date.strptime(params[:stop], '%m/%d/%Y') + 1.day - 1.second)
      fetch_visits
    end

    def today
      @start = Date.today.to_datetime
      @stop = start + 1.day - 1.second
      fetch_visits
    end

    def this_week
      @start = Date.today.beginning_of_week
      @stop = DateTime.current
      fetch_visits
    end

    def this_month
      @start = Date.today.beginning_of_month
      @stop = DateTime.current
      fetch_visits
    end


    # GET /dashboard/visits/:id
    def show_visit
      @visit = Visit.find params[:id]
      @type = @visit.type
    end

    # GET /dashboard/visits/:id/edit
    def edit_visit
      @visit = Visit.find params[:id]
      @type = params[:type]
    end

    # POST /dashboard/visits/:id/approve
    def approve_visit
      @visit = Visit.find params[:id]
      @type = @visit.type

      @visit.update_attributes :approved => true
    end

    # PUT /dashboard/visits/:id
    def update_visit
      @visit = Visit.find params[:id]
      @type = params[:type]

      if @visit.update_attributes(params[:visit])
        render
      end

    end


  end
end