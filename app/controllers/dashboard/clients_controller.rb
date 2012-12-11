module Dashboard
  class ClientsController  < DashboardController

    def index

      @care_recipients = CareRecipient.all
      # possible filter params: letter, name

    end

    def show
      @care_recipient = CareRecipient.find params[:id]
    end


  end
end