module Dashboard
  class VisitsController  < DashboardController

    def index

      # possible filter params: letter, name

      @completed = Visit.completed
      @pending = Visit.pending

      render :today
    end

    def today
      start = Date.today.to_datetime
      stop = start + 1.day - 1.second

      @completed = Visit.completed_by_agency_and_date_range current_user.id, start, stop
      @pending = Visit.pending_by_agency_and_date_range current_user.id, start, stop
    end

    def this_week
      start = Date.today.beginning_of_week
      stop = DateTime.current

      @completed = Visit.completed_by_agency_and_date_range current_user.id, start, stop
      @pending = Visit.pending_by_agency_and_date_range current_user.id, start, stop
    end

    def this_month
      start = Date.today.beginning_of_month
      stop = DateTime.current

      @completed = Visit.completed_by_agency_and_date_range current_user.id, start, stop
      @pending = Visit.pending_by_agency_and_date_range current_user.id, start, stop
    end

    def custom
      @start = (params[:start].blank?) ? Date.today.beginning_of_month : Date.strptime(params[:start], '%m/%d/%Y')
      @stop = (params[:stop].blank?) ? DateTime.current : (Date.strptime(params[:stop], '%m/%d/%Y') + 1.day - 1.second)

      @completed = Visit.completed_by_agency_and_date_range current_user.id, @start, @stop
      @pending = Visit.pending_by_agency_and_date_range current_user.id, @start, @stop
    end


    # GET /dashboard/visits/:id
    def edit_visit
      @visit = Visit.find params[:id]
      @type = params[:type]
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