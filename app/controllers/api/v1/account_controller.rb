module Api::V1
  class AccountController < ApiController

    doorkeeper_for :all
    respond_to :json

    # POST /api/v1/account
    def show
        render json: current_resource_owner
    end

    # POST /api/v1/account/password
    def password
      current_resource_owner.update_with_password params
    end

    def clients
      render json: current_resource_owner.care_recipients.map {|u| u.web_service_format(root_url)}
    end

    # GET /api/v1/account/history
    def history

    end

    # POST /api/v1/account/check-in
    def check_in
      session_guid = UUID.new

      @checkin = CheckIn.new params
      @checkin.in_out=true
      @checkin.session_guid=session_guid
      @checkin.create!

      render json: @checkin
    end

    # POST /api/v1/account/check-out
    def check_out

      @checkout = CheckIn.new params
      @checkout.in_out=false
      @checkout.create!

      render json: @checkout

    end

  end
end
