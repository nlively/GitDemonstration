module Api::V1
  class InHomeController < ApiController
    include ResourcesHelper

    doorkeeper_for :all, :scopes => [:client]
    respond_to :json



    # GET /api/v1/in_home/visits
    def visits

      #employees = current_resource_owner.users
      visits = current_resource_owner.open_visits

      @open_visits_by_employee = {}

      visits.each do |v|

        @open_visits_by_employee[v.user_id] = v.web_service_format(root_url)

      end

      render json: @open_visits_by_employee

    end



    # GET /api/in_home/v1/employees
    def employees

      render json: current_resource_owner.users.map {|u| u.web_service_format(root_url) }

    end


  end
end
