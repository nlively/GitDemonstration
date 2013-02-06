module Dashboard::Employees
  class ProfileController < Dashboard::EmployeesController

    def index
      @page_title = @employee.full_name + ' - Profile'
    end

  end
end
