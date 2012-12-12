module Dashboard
  class EmployeesController  < DashboardController

    def index
      # possible filter params: letter, name
      @employees = User.caregivers.order('last_name asc')

      @search_phrase = (params[:search_phrase].blank?) ? '' : params[:search_phrase]
    end

    # POST /dashboard/employees/search.js
    def search
      @search_phrase = (params[:search_phrase].blank?) ? '' : params[:search_phrase]

      unless @search_phrase.blank?
        fuzzy = '%' + @search_phrase + '%'
        @employees = current_user.agency.caregivers.where('first_name like ? OR last_name like ?', fuzzy, fuzzy).order('last_name asc')
      end
    end

    def show
      @employee = User.find params[:id]
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