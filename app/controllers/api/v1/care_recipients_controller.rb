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
      @client = CareRecipient.find params[:id]
      if (@client.users.include? current_resource_owner)
        render json: @client.notes
      end
    end

    # GET /api/v1/care-recipients/:id/photos
    def photos
      @client = CareRecipient.find params[:id]
      if (@client.users.include? current_resource_owner)
        render json: @client.photos
      end
    end

    # GET /api/v1/care-recipients/:id/history
    def history
      @client = CareRecipient.find params[:id]
      if (@client.users.include? current_resource_owner)
        render json: @client.visits
      end
    end


  end
end
