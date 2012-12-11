module Api::V1
  class SessionController < ApiController

    doorkeeper_for :all
    respond_to :json

    # POST /api/v1/session/note
    def note

      @note = Note.new :user_id => current_resource_owner.id, :note => params[:note]

      unless params[:visit_id].nil? or params[:visit_id].blank?
        @visit = Visit.find params[:visit_id]
        @note.visit_id = @visit.id
        @note.care_recipient_id = @visit.care_recipient_id
      end

      @note.save!

      ActivityStream.create_from_photo! @photo

      render json: @note.web_service_format(root_url)
    end

    # POST /api/v1/session/photo
    def photo
      logger.debug params.inspect

      @photo = Photo.new :user_id => current_resource_owner.id, :photo => params[:photo]

        unless params[:visit_id].nil? or params[:visit_id].blank?
          @visit = Visit.find params[:visit_id]
          @photo.visit_id = @visit.id
          @photo.care_recipient_id = @visit.care_recipient_id
        end

      @photo.save!

      ActivityStream.create_from_photo! @photo

      render json: @photo.web_service_format(root_url)

    end

  end
end
