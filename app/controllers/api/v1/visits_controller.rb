module Api::V1
  class VisitsController < ApiController

    doorkeeper_for :all
    respond_to :json

    # GET /api/v1/visits/:id
    def show
      @visit = Visit.find params[:id]
      # clean up this security later
      if @visit.user == current_resource_owner
        render json: @visit.web_service_format_deep(root_url)
      end
    end

  end
end