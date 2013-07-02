module Api::V1
  class SessionController < ApiController

    doorkeeper_for :all
    respond_to :json

    before_filter do
      if params[:type] == 'inhome'
        @care_recipient_id = current_resource_owner.id
        @user_id = params[:user_id]
      else
        @care_recipient_id = params[:care_recipient_id]
        @user_id = current_resource_owner.id
      end
    end

    # POST /api/v1/session/activities
    def activities
      unless params[:visit_id].nil? or params[:visit_id].blank? or params[:items].blank? or params[:items].empty?
        @visit = Visit.find params[:visit_id]

        @items = params[:items].split(',')
        @items.each do |item_id|
          item = AgencyDailyActivity.find(item_id)
          unless item.blank? or @visit.agency_daily_activities.include? item
            @visit.agency_daily_activities << item
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

    # GET /api/v1/session/notes
    def notes
      @visit = Visit.find params[:visit_id]

      render json: @visit.notes.order('created_at DESC').map{|n| n.web_service_format(root_url)}
    end

    # POST /api/v1/session/note
    def note

      if params[:note_id].blank?
        @note = Note.new :visit_id => params[:visit_id]
      else
        @note = Note.find params[:note_id]
      end

      @note.note = params[:note]
      @note.save!

      activity = ActivityStream.create_from_note! @note
      send_activity_stream_to_node_server activity

      render json: @note.web_service_format(root_url)
    end

    # POST /api/v1/session/photo
    def photo
      logger.debug params.inspect

      @photo = Photo.new :user_id => @user_id, :photo => params[:photo]

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
