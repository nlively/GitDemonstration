module Api::V1
  class InHomeController < ApiController
    include ResourcesHelper

    doorkeeper_for :all, :scopes => [:client]
    respond_to :json




    # GET /api/v1/in-home/open-visits
    def visits
      sort_string = sort_string_from_params
      limit= (params[:limit].blank?) ? 5 :params[:limit]

      @client = CareRecipient.find params[:id]
      if @client.users.include? current_resource_owner
        if filter_by_my_own
          @visits = @client.visits.where(:user_id => current_resource_owner.id).limit(limit).order(sort_string)
        else
          @visits = @client.visits.limit(5).order(sort_string)
        end

        render json: @visits.map {|m| m.web_service_format_deep(root_url)}

      end
    end



    # GET /api/in_home/v1/employees
    def employees

      render json: current_resource_owner.users

    end


  end
end
