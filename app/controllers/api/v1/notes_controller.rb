module Api::V1
  class NotesController < ApiController

    doorkeeper_for :all
    respond_to :json

    # GET /api/v1/notes/:id
    def show
      @note = Note.find params[:id]
      # clean up this security later
      render json: @note.web_service_format(root_url)
    end

  end
end
