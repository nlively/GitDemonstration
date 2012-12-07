module Api::V1
  class CareRecipientsController < ApiController

    doorkeeper_for :all
    respond_to :json

    # GET /api/v1/care-recipients/:id
    def show

      @recipient = CareRecipient.find params[:id]

      render json: @recipient

    end

    # GET /api/v1/care-recipients/:id/notes
    def notes
      sort_string = sort_string_from_params

      @client = CareRecipient.find params[:id]
      if @client.users.include? current_resource_owner
        if filter_by_my_own
          @notes = @client.notes.where(:user_id => current_resource_owner.id).order(sort_string)
        else
          @notes = @client.notes.order(sort_string)
        end

        render json: @notes.map {|m| m.web_service_format(root_url) }

      end
    end

    # GET /api/v1/care-recipients/:id/photos
    def photos
      sort_string = sort_string_from_params

      @client = CareRecipient.find params[:id]
      if @client.users.include? current_resource_owner
        if filter_by_my_own
          @photos = @client.photos.where(:user_id => current_resource_owner.id).order(sort_string)
        else
          @photos = @client.photos.order(sort_string)
        end

        render json: @photos.map {|m| m.web_service_format(root_url) }

      end
    end

    # GET /api/v1/care-recipients/:id/visits
    def visits
      sort_string = sort_string_from_params

      @client = CareRecipient.find params[:id]
      if @client.users.include? current_resource_owner
        if filter_by_my_own
          @visits = @client.visits.where(:user_id => current_resource_owner.id).order(sort_string)
        else
          @visits = @client.visits.order(sort_string)
        end

        render json: @visits.map {|m| m.web_service_format(root_url)}

      end
    end


  end
end
