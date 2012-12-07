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
      sort_string = sort_string_from_params

      if params[:care_recipient_id].blank?
        @photos = Photo.order(sort_string).find_all_by_user_id(current_resource_owner.id)
      else
        @photos = Photo.order(sort_string).find_all_by_care_recipient_id_and_user_id(params[:care_recipient_id], current_resource_owner.id)
      end

      render json: @photos
    end

    # GET /api/v1/account/notes
    def notes
      sort_string = sort_string_from_params

      if params[:care_recipient_id].blank?
        @notes = Note.order(sort_string).find_all_by_user_id(current_resource_owner.id)
      else
        @notes = Note.order(sort_string).find_all_by_care_recipient_id_and_user_id(params[:care_recipient_id], current_resource_owner.id)
      end

      render json: @notes
    end

    # GET /api/v1/account/clients
    def clients
      sort_string = sort_string_from_params

      if params[:name].blank?
        @clients = current_resource_owner.care_recipients.order(sort_string)
      else
        fuzzy = '%' + params[:name] + '%'
        @clients = current_resource_owner.care_recipients.order(sort_string).where("first_name LIKE ? OR last_name LIKE ?", fuzzy, fuzzy)
      end

      render json: @clients.map {|c| c.web_service_format(root_url)}
    end

    # GET /api/v1/account/visits
    def visits
      sort_string = sort_string_from_params
      render json: current_resource_owner.visits.order(sort_string)
    end

  end
end
