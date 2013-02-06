module Dashboard::Employees
  class VisitsController < Dashboard::EmployeesController

    def index
      @visits = @employee.visits.where(:approved => true).order('in_time desc')
      end

  end
end
