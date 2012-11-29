module Dashboard
  class VisitsController  < DashboardController

    def index

      # possible filter params: letter, name

      @completed = Visit.completed
      @pending = Visit.pending

    end


  end
end