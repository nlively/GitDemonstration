module Api::V1
  class CheckInsController < ApiController

    doorkeeper_for :all
    respond_to :json


    def create

      @checkin = CheckIn.new :user_id => current_resource_owner.id, :latitude => params[:latitude], :longitude => params[:longitude], :in_out => params[:in_out]

      if @checkin.in_out
        @visit = Visit.create! :user_id => @checkin.user_id, :in_time => DateTime.current

        @checkin.visit = @visit
      else
        @visit = Visit.find params[:visit_id]
        @visit.out_time = DateTime.current
        @visit.save!
        @checkin.visit = @visit

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
