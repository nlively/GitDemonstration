module Api::V1
  class WorkBreaksController < ApiController

    doorkeeper_for :all
    respond_to :json


    # POST /api/v1/work_breaks
    def create

      if params[:type] == 'inhome'
        @care_recipient_id = current_resource_owner.id
        @user_id = params[:user_id]
      else
        @care_recipient_id = params[:care_recipient_id]
        @user_id = current_resource_owner.id
      end

      @break_checkin = WorkBreakCheckIn.new :user_id => @user_id, :latitude => params[:latitude], :longitude => params[:longitude], :in_out => params[:in_out]

      if params[:auto] == '1'
        @break_checkin.auto = true
      end

      if @break_checkin.in_out
        @break = WorkBreak.create! :user_id => @break_checkin.user_id, :in_time => DateTime.current, :visit_id => params[:visit_id]
        @break_checkin.work_break = @break
      else
        @break = WorkBreak.find params[:work_break_id]
        @break.out_time = DateTime.current
        @break.save!
        @break_checkin.work_break = @break
      end

      @break_checkin.save!

      #Create an activity stream record
      activity = ActivityStream.create_from_work_break! @break, @break_checkin.in_out
      send_activity_stream_to_node_server activity

      if @break_checkin.in_out
        render json: @break.web_service_format(root_url)
      else
        render json: { :success => true, :message => 'You have been clocked in from your break.' }
      end

    end

  end
end
