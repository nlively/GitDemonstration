module Dashboard::Employees
  class VisitsController < Dashboard::EmployeesController

    def index
      @visits = @employee.visits.order('in_time desc')
      end

  end
end
