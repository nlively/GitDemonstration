module Api::V1
  class EmployeesController < ApiController
    include ResourcesHelper

    doorkeeper_for :all
    respond_to :json

    # GET /api/v1/employees/:id
    def show

      @employee = User.find params[:id]

      render json: @employee.web_service_format(root_url)

    end

    # GET /api/v1/employees/:id/notes
    def notes
      sort_string = sort_string_from_params

      @employee = User.find params[:id]
      if @employee.care_recipients.include? current_resource_owner
        if filter_by_my_own
          @notes = @employee.notes.where(:care_recipient_id => current_resource_owner.id).order(sort_string)
        else
          @notes = @employee.notes.order(sort_string)
        end

        render json: @notes.map {|m| m.web_service_format(root_url) }

      end
    end

    # GET /api/v1/employees/:id/photos
    def photos
      sort_string = sort_string_from_params

      @employee = User.find params[:id]
      if @employee.care_recipients.include? current_resource_owner
        if filter_by_my_own
          @photos = @employee.photos.where(:care_recipient_id => current_resource_owner.id).order(sort_string)
        else
          @photos = @employee.photos.order(sort_string)
        end

        render json: @photos.map {|m| m.web_service_format(root_url) }

      end
    end

    # GET /api/v1/employees/:id/visits
    def visits
      sort_string = sort_string_from_params
      limit= (params[:limit].blank?) ? 5 :params[:limit]

      @employee = User.find params[:id]
      if @employee.care_recipients.include? current_resource_owner
        if filter_by_my_own
          @visits = @employee.visits.where(:care_recipient_id => current_resource_owner.id).limit(limit).order(sort_string)
        else
          @visits = @employee.visits.limit(5).order(sort_string)
        end

        render json: @visits.map {|m| m.web_service_format_deep(root_url)}

      end
    end



  end
end
