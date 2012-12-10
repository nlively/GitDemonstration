module Dashboard
  class VisitsController  < DashboardController

    def index

      # possible filter params: letter, name

      @completed = Visit.completed
      @pending = Visit.pending

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
      @completed = Visit.completed
      @pending = Visit.pending
    end


  end
end