module Dashboard::Clients
  class NotesController < Dashboard::ClientsController

    before_filter do
      @care_recipient = CareRecipient.find params[:id]
    end

    def index
      @notes = @care_recipient.notes.order('created_at desc')
      @photos = @care_recipient.photos.order('created_at desc')
    end

    def show
      @note = Note.where('id = ? and care_recipient_id = ?', params[:note_id], params[:id]).first
    end

  end
end
