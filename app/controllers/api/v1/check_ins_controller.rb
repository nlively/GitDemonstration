module Api::V1
  class CheckInsController < ApiController

    doorkeeper_for :all
    respond_to :json



    # POST /api/v1/check_ins
    def create

      if params[:type] == 'inhome'
        @care_recipient_id = current_resource_owner.id
        @user_id = params[:user_id]
      else
        @care_recipient_id = params[:care_recipient_id]
        @user_id = current_resource_owner.id
      end


      @checkin = CheckIn.new :user_id => @user_id, :latitude => params[:latitude], :longitude => params[:longitude], :in_out => params[:in_out]

      if params[:auto] == '1'
        @checkin.auto=true
      end

      if @checkin.in_out
        @visit = Visit.create! :user_id => @user_id, :in_time => DateTime.current, :care_recipient_id => @care_recipient_id, :location_id => params[:location_id], :agency_id => current_resource_owner.agency_id

        if params[:type] == 'inhome'
          @visit.location = current_resource_owner.default_location
          @visit.save
        end


        unless params[:activities].blank?
          activities = params[:activities].split(',')
          activities.each do |key|
            @visit.agency_daily_activities << AgencyDailyActivity.find(key)
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

        unless params[:notes].blank?
          @note = Note.create :user_id => @user_id, :care_recipient_id => @care_recipient_id, :note => params[:notes]
          @visit.notes << @note
        end

        @checkin.visit = @visit
      else
        @visit = Visit.find params[:visit_id]

        @temp_loc = Location.new :latitude => params[:latitude], :longitude => params[:longitude]

        @distance = @visit.location.distance_from(@temp_loc)

        if @distance < 0.1 || params[:confirm] == '1' || params[:confirm] == 'true'

          if params[:auto] == '1' || params[:auto] == 'true'
            @visit.auto_checked_out=true
          end

          @visit.out_time = DateTime.current
          @visit.save!
          @checkin.visit = @visit

        else

          render json: { :distance => @distance, :success => false, :message => 'Please confirm checkout.'  }
          return

        end

      end

      @checkin.save!

      unless params[:photo].blank?
        @photo = Photo.create! :care_recipient_id => params[:care_recipient_id], :user_id => current_resource_owner.id, :photo => params[:photo], :visit_id => @visit.id
      end

      #Create an activity stream record
      activity = ActivityStream.create_from_visit! @visit, @checkin.in_out
      send_activity_stream_to_node_server activity

      if @checkin.in_out
        render json: @visit.web_service_format(root_url)
      else
        render json: { :distance => @distance, :success => true, :message => 'You have been checked out!' }
      end

    end

  end
end
