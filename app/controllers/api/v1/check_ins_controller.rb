module Api::V1
  class CheckInsController < ApiController

    doorkeeper_for :all
    respond_to :json


    # POST /api/v1/check_ins
    def create

      logger.debug request.inspect

      @checkin = CheckIn.new :user_id => current_resource_owner.id, :latitude => params[:latitude], :longitude => params[:longitude], :in_out => params[:in_out]

      if @checkin.in_out
        @visit = Visit.create! :user_id => @checkin.user_id, :in_time => DateTime.current, :care_recipient_id => params[:care_recipient_id], :location_id => params[:location_id], :agency_id => current_resource_owner.agency_id

        unless params[:activities].blank?
          activities = params[:activities].split(',')
          activities.each do |key|
            @visit.caregiver_tasks << CaregiverTask.find(key)
          end
        end

        unless params[:client_statuses].blank?
          client_statuses = params[:client_statuses].split(',')
          client_statuses.each do |key|
            @visit.patient_statuses << PatientStatus.find(key)
          end
        end

        unless params[:observations].blank?
          observations = params[:observations].split(',')
          observations.each do |key|
            @visit.observations << Observation.find(key)
          end
        end

        @checkin.visit = @visit
      else
        @visit = Visit.find params[:visit_id]
        @visit.out_time = DateTime.current
        @visit.save!
        @checkin.visit = @visit

      end

      @checkin.save!


      unless params[:photo].blank?
        @photo = Photo.create! :care_recipient_id => params[:care_recipient_id], :user_id => current_resource_owner.id, :photo => params[:photo], :visit_id => @visit.id
      end


      activity = ActivityStream.create_from_visit! @visit, @checkin.in_out
      send_activity_stream_to_node_server activity


      render json: @visit.web_service_format(root_url)

    end

  end
end
