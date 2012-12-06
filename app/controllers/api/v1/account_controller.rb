module Api::V1
  class AccountController < ApiController

    doorkeeper_for :all
    respond_to :json

    # GET /api/v1/account
    def index
      render json: current_resource_owner
    end

    # POST /api/v1/account
    def update
      filtered_params = {
        :first_name => params[:first_name],
        :last_name =>params[:last_name],
      }

      if current_resource_owner.update_attributes filtered_params
        render json: {:result => true, :message => "Profile has been updated"}
      else
        render json: {:result => false, :message => "Profile could not be updated"}
      end
    end

    # POST /api/v1/account/password
    def password
      filtered_params = {
        :current_password => params[:current_password],
        :password =>params[:password],
        :password_confirmation => params[:password_confirmation]
      }
      if current_resource_owner.update_with_password filtered_params
        render json: {:result => true, :message => "Password has been changed"}
      else
        render json: {:result => false, :message => "Failed to change password"}
      end

    end

    # GET /api/v1/account/photos
    def photos
      @photos = Photo.find_all_by_user_id current_resource_owner.id
      render json: @photos
    end

    # GET /api/v1/account/notes
    def notes
      @notes = Note.find_all_by_user_id current_resource_owner.id
      render json: @notes
    end

    # GET /api/v1/account/clients
    def clients
      render json: current_resource_owner.care_recipients.map {|u| u.web_service_format(root_url)}
    end

    # GET /api/v1/account/history
    def history
      render json: current_resource_owner.visits
    end

  end
end
