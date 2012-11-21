module Dashboard
  class ClientsController  < DashboardController

    def index

      @care_recipients = CareRecipient.all
      # possible filter params: letter, name

    end


  end
end