module Api::V1
  class ApiController < ::ApplicationController
    def current_resource_owner
      if doorkeeper_token
        logger.debug sprintf('Current user id for api request: %d', doorkeeper_token.resource_owner_id)
        User.find(doorkeeper_token.resource_owner_id)
      end
    end

    def filter_by_my_own
      return (params[:own] == "1")
    end

    def sort_string_from_params default_field='id', default_order='desc'

      # Give precedence to the "sort_string" request parameter, which would allow sorting
      # on multiple fields if specified by the app
      return params[:sort_string] unless params[:sort_string].blank?

      # Now configure the sort field and sort order, giving precedence to the request
      # parameters, but falling through to defaults if needed
      sort_field = (params[:sort_field].blank?) ? default_field : params[:sort_field]
      sort_order = (params[:sort_order].blank?) ? default_order : params[:sort_order]

      return sprintf("%s %s", sort_field, sort_order)
    end

  end
end