module Dashboard
  class EmployeesController  < DashboardController

    def index

      # possible filter params: letter, name
      @employees = User.caregivers

    end


  end
end