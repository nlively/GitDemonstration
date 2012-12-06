module Api::V1
  class GeoController < ApiController

    doorkeeper_for :all
    respond_to :json

    # GET,POST /api/v1/geo/clients
    def clients
      @recipients = get_care_recipients
      @recipients_formatted = @recipients.map do |r|
        logger.debug r.inspect
        recipient = CareRecipient.find r['care_recipient_id']
        location = Location.find r['location_id']
        result = recipient.web_service_format(root_url, location)
        result[:distance] = r['distance']

        result # return the result
      end
      render json: @recipients_formatted
    end




    # Find care recipients mapped to current user based on specified search parameters
    def get_care_recipients

      search_origin = {"lat" => params[:latitude], "long" => params[:longitude]}

      query_sql = "SELECT cr.id as care_recipient_id, l.id as location_id, l.latitude, l.longitude, 3956 * 2 * ASIN(SQRT( POWER(SIN((:origin_lat -
          abs(l.latitude)) * pi()/180 / 2),2) + COS(:origin_lat * pi()/180 ) *
          COS(abs(l.latitude) *  pi()/180) * POWER(SIN((:origin_long - l.longitude) *  pi()/180 / 2), 2) )) as distance
      FROM locations l
        JOIN care_recipients_locations crl ON crl.location_id = l.id
        JOIN care_recipients cr ON cr.id = crl.care_recipient_id
        JOIN care_recipients_users cru ON cru.care_recipient_id = cr.id AND cru.user_id = :user_id
      WHERE
        3956 * 2 * ASIN(SQRT( POWER(SIN((:origin_lat -
      abs(l.latitude)) * pi()/180 / 2),2) + COS(:origin_lat * pi()/180 ) *
      COS(abs(l.latitude) *  pi()/180) * POWER(SIN((:origin_long - l.longitude) *  pi()/180 / 2), 2) )) <= 100
      "
      @query_results = ActiveRecord::Base.connection.select_all(
        ActiveRecord::Base.send("sanitize_sql_array", [
          query_sql,
          { :user_id => current_resource_owner.id, :origin_lat => search_origin["lat"], :origin_long => search_origin["long"] }
        ] )
      )

      return @query_results

    rescue nil

    end




  end
end
