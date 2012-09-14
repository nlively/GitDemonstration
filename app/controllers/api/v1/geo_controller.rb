module Api::V1
  class GeoController < ApiController

    doorkeeper_for :all
    respond_to :json

    # GET,POST /api/v1/providers/clients
    def clients

    end

  end
end
