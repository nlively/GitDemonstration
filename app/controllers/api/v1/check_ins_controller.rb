module Api::V1
  class CheckInsController < ApiController

    doorkeeper_for :all
    respond_to :json


    def create

      @checkin = CheckIn.create! :user_id => params[:user_id], :latitude => params[:latitude], :longitude => params[:longitude]

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
