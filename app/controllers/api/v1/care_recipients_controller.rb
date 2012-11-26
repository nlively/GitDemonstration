module Api::V1
  class CareRecipientsController < ApiController

    doorkeeper_for :all
    respond_to :json

    # GET /api/v1/care-recipients/:id
    def show

      @recipient = CareRecipient.find params[:id]

      render json: @recipient

    end

    # GET /api/v1/care-recipients/:id/history
    def history

    end


  end
end
