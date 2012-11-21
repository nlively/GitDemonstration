module Dashboard::Clients
  class NotesController < Dashboard::ClientsController

    before_filter do
      @care_recipient = CareRecipient.find params[:id]
    end

    def index

    end

  end
end
