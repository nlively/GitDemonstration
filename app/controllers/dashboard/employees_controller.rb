module Dashboard
  class EmployeesController  < DashboardController

    before_filter do
          @employee = User.find params[:id] unless params[:id].blank?
        end

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

    def show
      @employee = User.find params[:id]
    end

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

    def new
      @user = User.new
    end

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



  end
end