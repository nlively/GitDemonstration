module Dashboard::Employees
  class ClientsController < Dashboard::EmployeesController

    def index
      @clients = @employee.care_recipients.order('last_name asc')
    end

  end
end
