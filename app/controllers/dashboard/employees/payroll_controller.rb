module Dashboard::Employees
  class PayrollController < Dashboard::EmployeesController

    def index

      @batches = @employee.payroll_batches

    end

  end
end
