module Dashboard
  class EmployeesController  < DashboardController

    before_filter do
      @employee = User.find params[:id] unless params[:id].blank?
    end

    # GET /dashboard/employees
    def index
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
      #@employee = User.find params[:id]
      redirect_to dashboard_employees_profile_path(params[:id])
    end

    # PUT /dashboard/employees/:id
    def update
      @employee = User.find params[:id]

      respond_to do |format|
        if @employee.update_attributes! params[:user]
          format.html { redirect_to dashboard_employees_profile_path(@employee), notice: 'Employee was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { redirect_to dashboard_employees_profile_path(@employee) }
          format.json { render json: @employee.errors, status: :unprocessable_entity }
        end
      end
    end

    # GET /dashboard/employees/new
    def new
      @user = User.new
    end

    # POST /dashboard/employees
    def create
      @user = User.new(params[:user])

      @user.agency = current_user.agency

      respond_to do |format|
        if @user.save
          @user.has_role! :caregiver
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
      redirect_to redirect_destination(:back), :notice => 'Account has been deleted for ' + @employee.full_name
    end

    # GET /dashboard/employees/:id/unfreeze
    def unfreeze

    end

    # POST /dashboard/employees/:id/unfreeze
    def unfreeze_update
      @employee.is_active = true
      @employee.save!

      redirect_to redirect_destination(:back), :notice => 'Account has been re-activated for ' + @employee.full_name
    end

    # GET /dashboard/employees/:id/freeze
    def freeze

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