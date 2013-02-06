module Dashboard::Employees
  class VisitsController < Dashboard::EmployeesController

    def index
      @visits = @employee.visits.where(:approved => true).order('in_time desc')
      @page_title = @employee.full_name + ' - Visits'
      end

  end
end
