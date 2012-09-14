module Api::V1
  class CheckInsController < ApiController

    doorkeeper_for :all

    respond_to :json

    def create

      @checkin = CheckIn.create! :user_id => params[:user_id], :latitude => params[:latitude], :longitude => params[:longitude]

      render json: @checkin

    end

    def index

      @checkins = CheckIn.all

      render json: @checkins

    end
  end
end
