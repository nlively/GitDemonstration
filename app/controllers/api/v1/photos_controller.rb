module Api::V1
  class PhotosController < ApiController

    doorkeeper_for :all
    respond_to :json

    # GET /api/v1/photos/:id
    def show
      @photo = Photo.find params[:id]
      # clean up this security later
      render json: @photo
    end

  end
end
