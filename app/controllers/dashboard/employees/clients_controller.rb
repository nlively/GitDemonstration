module Dashboard::Employees
  class ClientsController < Dashboard::EmployeesController

    def index
      @page_title = @employee.full_name + ' - Clients'
      @clients = @employee.care_recipients.order('last_name asc')
    end

    # GET /dashboard/employees/:id/clients/select
    def select_client
      @page_title = @employee.full_name + ' - Assign Client'
      @clients = @agency.care_recipients
    end

    # POST /dashboard/employees/:id/clients/select
    def assign_client
      @user = User.find params[:id]
      @care_recipient = User.find params[:client_id]

      @user.care_recipients << @care_recipient unless @user.care_recipients.include? @care_recipient
      @user.save!

      redirect_to dashboard_employees_clients_path(@user)

    end

  end
end
