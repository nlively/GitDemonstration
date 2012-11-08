module Api::V1
  class CheckInsController < ApiController

    doorkeeper_for :all
    respond_to :json


    def create

      @checkin = CheckIn.new :user_id => params[:user_id], :latitude => params[:latitude], :longitude => params[:longitude], :in_out => params[:in_out]

      if @checkin.in_out
        @checkin.session_guid = UUID.generate
      else
        @checkin.session_guid = params[:session_guid]
      end

      @checkin.save!

      respond_to do |format|
        format.html { redirect_to 'index' }
        format.json { render json: @checkin }
      end

    end

    def index

      @checkins = CheckIn.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @checkins }
      end

    end
  end
end
