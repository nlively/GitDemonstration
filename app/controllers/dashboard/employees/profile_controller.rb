module Dashboard::Employees
  class ProfileController < Dashboard::EmployeesController

    before_filter do
      @employee = User.find params[:id]
    end

    def index
    end

  end
end
