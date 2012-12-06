module Api::V1
  class PhotosController < ApiController

    doorkeeper_for :all
    respond_to :json

    # POST /api/v1/photos
    def create
      #@photo = Photo.new(params)
      #
      #if @photo.save
      #  render json: @photo, status: :created, note: @photo
      #else
      #  render json: @photo.errors, status: :unprocessable_entity
      #end

      # just a stub
      render json: true

    end

    def show

    end

  end
end
