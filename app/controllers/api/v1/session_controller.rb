module Api::V1
  class SessionController < ApiController

    doorkeeper_for :all
    respond_to :json

    # POST /api/v1/session/activities
    def activities
      unless params[:visit_id].nil? or params[:visit_id].blank? or params[:items].blank? or params[:items].empty?
        @visit = Visit.find params[:visit_id]

        @items = params[:items].split(',')
        @items.each do |item_id|
          item = CaregiverTask.find(item_id)
          unless item.blank? or @visit.caregiver_tasks.include? item
            @visit.caregiver_tasks << item
          end
        end

        @visit.save!

        activity = ActivityStream.create_from_data! @visit
        send_activity_stream_to_node_server activity

        render json: true
      end
    end

    # POST /api/v1/session/client-status
    def client_status
      unless params[:visit_id].nil? or params[:visit_id].blank? or params[:items].blank? or params[:items].empty?
        @visit = Visit.find params[:visit_id]

        @items = params[:items].split(',')
        @items.each do |item_id|
          item = PatientStatus.find(item_id)
          unless item.blank? or @visit.patient_statuses.include? item
            @visit.patient_statuses << item
          end
        end

        @visit.save!

        activity = ActivityStream.create_from_data! @visit
        send_activity_stream_to_node_server activity

        render json: true
      end
    end

    # POST /api/v1/session/observations
    def observations
      unless params[:visit_id].nil? or params[:visit_id].blank? or params[:items].blank? or params[:items].empty?
        @visit = Visit.find params[:visit_id]

        @items = params[:items].split(',')
        @items.each do |item_id|
          item = Observation.find(item_id)
          unless item.blank? or @visit.observations.include? item
            @visit.observations << item
          end
        end

        @visit.save!

        activity = ActivityStream.create_from_data! @visit
        send_activity_stream_to_node_server activity

        render json: true
      end
    end



    # POST /api/v1/session/note
    def note

      @note = Note.new :user_id => current_resource_owner.id, :note => params[:note]

      unless params[:visit_id].nil? or params[:visit_id].blank?
        @visit = Visit.find params[:visit_id]
        @note.visit_id = @visit.id
        @note.care_recipient_id = @visit.care_recipient_id
      end

      @note.save!

      activity = ActivityStream.create_from_note! @note
      send_activity_stream_to_node_server activity

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

      activity = ActivityStream.create_from_photo! @photo
      send_activity_stream_to_node_server activity

      render json: @photo.web_service_format(root_url)

    end

  end
end
