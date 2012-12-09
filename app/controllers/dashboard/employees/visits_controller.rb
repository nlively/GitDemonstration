module Dashboard::Employees
  class VisitsController < Dashboard::EmployeesController

    before_filter do
      @employee = User.find params[:id]
    end

    def index
      @visits = @employee.visits.order('in_time desc')
      end

  end
end
