module Dashboard
  class ClientsController  < DashboardController

    def index

      @care_recipients = CareRecipient.all
      # possible filter params: letter, name

    end

    # POST /dashboard/clients/search.js
    def search
      @search_phrase = (params[:search_phrase].blank?) ? '' : params[:search_phrase]

      unless @search_phrase.blank?
        fuzzy = '%' + @search_phrase + '%'
        @care_recipients = current_user.agency.care_recipients.where('first_name like ? OR last_name like ?', fuzzy, fuzzy).order('last_name asc')
      end
    end

    def show
      @care_recipient = CareRecipient.find params[:id]

    end

    def update
      @care_recipient = CareRecipient.find params[:id]

      respond_to do |format|
        if @care_recipient.update_attributes(params[:care_recipient])
          format.html { redirect_to dashboard_clients_profile_path(@care_recipient), notice: 'Client was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @care_recipient.errors, status: :unprocessable_entity }
        end
      end
    end

    def new
      @care_recipient = CareRecipient.new
    end

    def create
      @care_recipient = CareRecipient.new(params[:care_recipient])

      @care_recipient.agency = current_user.agency

      respond_to do |format|
        if @care_recipient.save
          format.html { redirect_to dashboard_client_path(@care_recipient), notice: 'Client was successfully created.' }
          format.json { render json: @care_recipient, status: :created, location: @care_recipient }
        else
          format.html { render action: "new" }
          format.json { render json: @care_recipient.errors, status: :unprocessable_entity }
        end
      end
    end


  end
end