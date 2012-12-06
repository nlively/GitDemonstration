module Api::V1
  class NotesController < ApiController

    doorkeeper_for :all
    respond_to :json

    # POST /api/v1/notes
    def create
      @note = Note.new(params)

      if @note.save
        render json: @note, status: :created, note: @note
      else
        render json: @note.errors, status: :unprocessable_entity
      end
    end

    def show

    end

  end
end
