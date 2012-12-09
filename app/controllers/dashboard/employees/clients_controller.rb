module Dashboard::Employees
  class ClientsController < Dashboard::EmployeesController

    before_filter do
      @employee = User.find params[:id]
    end

    def index
      @clients = @employee.care_recipients.order('last_name asc')
    end

  end
end
