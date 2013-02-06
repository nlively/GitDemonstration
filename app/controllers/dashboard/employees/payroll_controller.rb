module Dashboard::Employees
  class PayrollController < Dashboard::EmployeesController

    def index
      @page_title = @employee.full_name + ' - Payroll'

      @batches = @employee.payroll_batches

    end

  end
end
