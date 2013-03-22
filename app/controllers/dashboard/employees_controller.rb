module Dashboard
  class EmployeesController  < DashboardController

    before_filter do
      @employee = User.find params[:id] unless params[:id].blank?
      @location = (@employee.nil? or @employee.location.nil?) ? Location.new : @employee.location
    end

    # GET /dashboard/employees
    def index
      @page_title = "Employees"
      # possible filter params: letter, name
      @employees = @agency.caregivers.order('last_name asc')

      @search_phrase = (params[:search_phrase].blank?) ? '' : params[:search_phrase]
    end

    # POST /dashboard/employees/search.js
    def search
      @search_phrase = (params[:search_phrase].blank?) ? '' : params[:search_phrase]

      unless @search_phrase.blank?
        fuzzy = '%' + @search_phrase + '%'
        @employees = @agency.caregivers.where('first_name like ? OR last_name like ?', fuzzy, fuzzy).order('last_name asc')
      end
    end

    # GET /dashboard/employees/:id
    def show
      @employee = User.find params[:id]
      @employees = [@employee]
      #redirect_to dashboard_employees_profile_path(params[:id])
      @page_title = @employee.full_name
    end

    # PUT /dashboard/employees/:id
    def update
      @employee = User.find params[:id]
      @location = @employee.location

      user_tried_to_change_password = params[:user][:password].length > 0

      if user_tried_to_change_password && params[:user][:password] != params[:user][:password_confirmation]
        flash[:error] = "Your passwords do not match"
        redirect_to dashboard_employees_profile_path(@employee)
      elsif user_tried_to_change_password && (! User.valid_password? params[:user][:password])
        flash[:error] = "Your password needs to be at least 6 characters long"
        redirect_to dashboard_employees_profile_path(@employee)
      else

        params[:user].delete :password
        params[:user].delete :password_confirmation

        unless @employee.id == current_user.id
          if params[:admin_access] == '1'
            @employee.has_role! :agency_administrator
          else
            @employee.has_no_role! :agency_administrator
          end
        end

        #if @location.blank?
        #  @location = Location.create params[:location]
        #  @employee.location = @location
        #else
        #  @location.update_attributes! params[:location]
        #end

        if @employee.update_attributes! params[:user]
          redirect_to dashboard_employees_profile_path(@employee), notice: 'Employee was successfully updated.'
        else
          redirect_to dashboard_employees_profile_path(@employee)
        end
      end
    end

    # GET /dashboard/employees/new
    def new

      if @agency.max_users <= @agency.users.count
        redirect_to dashboard_employees_path, :notice => 'In order to add an employee, you must add users to your account.  Please visit the Settings tab to make this change.'
      end

      @page_title = 'Add a New Employee'
      @user = User.new
      @location = Location.new
    end

    # POST /dashboard/employees
    def create
      @user = User.new(params[:user])

      @user.agency = current_user.agency

      respond_to do |format|
        if @user.save
          @user.has_role! :caregiver

          if params[:admin_access] == '1'
            @user.has_role! :agency_administrator
          end

          #MailerUser.caregiver_welcome(@user, params[:user][:password]).deliver

          format.html { redirect_to dashboard_employee_path(@user), notice: 'Employee was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end






    # GET /dashboard/employees/:id/delete
    def delete

    end

    # DELETE /dashboard/employees/:id
    def destroy
      @employee.deleted = true
      @employee.is_active = false
      @employee.save!
      @employee.scramble_email!
      redirect_to redirect_destination(:back), :notice => 'Account has been deleted for ' + @employee.full_name
    end

    # GET /dashboard/employees/:id/unfreeze
    def unfreeze
      @page_title = 'Unfreeze Account'

    end

    # POST /dashboard/employees/:id/unfreeze
    def unfreeze_update
      @employee.is_active = true
      @employee.save!

      redirect_to redirect_destination(:back), :notice => 'Account has been re-activated for ' + @employee.full_name
    end

    # GET /dashboard/employees/:id/freeze
    def freeze
      @page_title = 'Freeze Account'

    end

    # POST /dashboard/employees/:id/freeze
    def freeze_update
      @employee.is_active = false
      @employee.save!

      logger.debug request.env['HTTP_REFERER']

      redirect_to redirect_destination(:back), :notice => 'Account has been frozen for ' + @employee.full_name
    end

    # GET /dashboard/employees/:id/reset-password
    def reset_password
      @page_title = 'Reset Password'

    end

    # POST /dashboard/employees/:id/reset-password
    def reset_password_update

      logger.debug request.env['HTTP_REFERER']

      if params[:user][:password] != params[:user][:confirm_password]
        flash[:error] = "Your passwords do not match"
        render action: 'reset_password'
      elsif ! User.valid_password? params[:user][:password]
        flash[:error] = "Your password needs to be at least 6 characters long"
        render action: 'reset_password'
      else
        @employee.password = params[:user][:password]
        @employee.save!

        redirect_to redirect_destination(:back), :notice => 'Password has been changed for ' + @employee.full_name
      end


    end



  end
end