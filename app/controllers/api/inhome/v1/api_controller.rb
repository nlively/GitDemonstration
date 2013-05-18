module Api::InHome::V1
  class ApiController < ::ApplicationController

    def current_resource_owner
      if doorkeeper_token
        logger.debug sprintf('Current user id for api request: %d', doorkeeper_token.resource_owner_id)
        CareRecipient.find(doorkeeper_token.resource_owner_id)

      end
    end

    def filter_by_my_own
      return (params[:own] == "1")
    end

    def sort_string_from_params options={}

      defaults = {
          :sort_field => 'id',
          :sort_order => 'desc',
          :prefix => nil
      }

      defaults.merge! options

      unless defaults[:prefix].blank?
        defaults[:sort_field] = sprintf('%s.%s', defaults[:prefix], defaults[:sort_field])
      end

      # Give precedence to the "sort_string" request parameter, which would allow sorting
      # on multiple fields if specified by the app
      return params[:sort_string] unless params[:sort_string].blank?

      # Now configure the sort field and sort order, giving precedence to the request
      # parameters, but falling through to defaults if needed
      sort_field = (params[:sort_field].blank?) ? defaults[:sort_field] : params[:sort_field]
      sort_order = (params[:sort_order].blank?) ? defaults[:sort_order] : params[:sort_order]

      return sprintf("%s %s", sort_field, sort_order)
    end

    def send_activity_stream_to_node_server activity_stream

      rendered = render_to_string( :partial => 'shared/row_activity_stream.html.erb', :formats => [:html], :locals => { :item => activity_stream, :css_class => 'js'})
      hash = {
          :id => activity_stream.id,
          :rendered => rendered
      }

      agency_id = current_resource_owner.agency.id
      channel_id = sprintf('agency_%d', agency_id)

      logger.debug 'Channel: ' + channel_id

      Pusher[channel_id].trigger('new activity stream', hash)

    end


    # GET /api/inhome/v1/employees
    def employees

      render json: current_resource_owner.users

    end

  end
end