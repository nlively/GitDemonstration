module Api::V1
  class CheckInsController < ApiController

    doorkeeper_for :all
    respond_to :json


    # POST /api/v1/check_ins
    def create

      @checkin = CheckIn.new :user_id => current_resource_owner.id, :latitude => params[:latitude], :longitude => params[:longitude], :in_out => params[:in_out]

      if @checkin.in_out
        @visit = Visit.create! :user_id => @checkin.user_id, :in_time => DateTime.current, :care_recipient_id => params[:care_recipient_id], :location_id => params[:location_id]

        @checkin.visit = @visit
      else
        @visit = Visit.find params[:visit_id]
        @visit.out_time = DateTime.current
        @visit.save!
        @checkin.visit = @visit

      end

      @checkin.save!

      @note = nil

      unless params[:note].blank?
        @note = Note.create! :care_recipient_id => params[:care_recipient_id], :user_id => current_resource_owner.id, :note => params[:note], :visit_id => @visit.id
      end

      unless params[:photo].blank?
        @photo = Photo.create! :care_recipient_id => params[:care_recipient_id], :user_id => current_resource_owner.id, :photo => params[:photo], :visit_id => @visit.id, :note => @note
      end

      render json: @visit.web_service_format(root_url)

    end

  end
end
