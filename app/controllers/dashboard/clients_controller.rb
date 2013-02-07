module Dashboard
  class ClientsController  < DashboardController

    before_filter do
      @care_recipient = CareRecipient.find params[:id]  unless params[:id].blank?
      @location = (@care_recipient.nil? or @care_recipient.default_location.nil?) ? Location.new : @care_recipient.default_location
    end

    def index
      @page_title = 'Clients'

      @care_recipients = @agency.care_recipients
      # possible filter params: letter, name

    end

    # POST /dashboard/clients/search.js
    def search
      @search_phrase = (params[:search_phrase].blank?) ? '' : params[:search_phrase]

      unless @search_phrase.blank?
        fuzzy = '%' + @search_phrase + '%'
        @care_recipients = @agency.care_recipients.where('first_name like ? OR last_name like ?', fuzzy, fuzzy).order('last_name asc')
      end
    end

    def show
      @care_recipient = CareRecipient.find params[:id]
      @care_recipients = [@care_recipient]

      #redirect_to dashboard_clients_profile_path(params[:id])
      @page_title = @care_recipient.full_name
    end

    def update
      @care_recipient = CareRecipient.find params[:id]

      respond_to do |format|
        if @care_recipient.update_attributes(params[:care_recipient])


          if @location.blank?
            @location = Location.create params[:location]
            @care_recipient.location = @location
          else
            @location.update_attributes! params[:location]
          end

          format.html { redirect_to dashboard_clients_profile_path(@care_recipient), notice: 'Client was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @care_recipient.errors, status: :unprocessable_entity }
        end
      end
    end

    def new
      @page_title = 'Add a New Client'
      @care_recipient = CareRecipient.new
      @location = Location.new
      unless params[:employee].blank?
        @employee = User.find params[:employee]
      end
    end

    def create
      @care_recipient = CareRecipient.new(params[:care_recipient])
      @location = Location.create(params[:location])

      @care_recipient.agency = current_user.agency
      @care_recipient.default_location = @location
      @care_recipient.locations << @location

      unless params[:employee_id].blank?
        @employee = User.find(params[:employee_id])
        if @employee.agency == current_user.agency
          @care_recipient.users << @employee
        end
      end

      respond_to do |format|
        if @care_recipient.save
          format.html { redirect_to redirect_destination(dashboard_client_path(@care_recipient)), notice: 'Client was successfully created.' }
          format.json { render json: @care_recipient, status: :created, location: @care_recipient }
        else
          format.html { render action: "new" }
          format.json { render json: @care_recipient.errors, status: :unprocessable_entity }
        end
      end
    end


  end
end