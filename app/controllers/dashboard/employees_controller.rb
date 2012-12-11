module Dashboard
  class EmployeesController  < DashboardController

    def index

      # possible filter params: letter, name
      @employees = User.caregivers

    end

    def show
      @employee = User.find params[:id]
    end


  end
end