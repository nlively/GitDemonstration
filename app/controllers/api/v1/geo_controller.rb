module Api::V1
  class GeoController < ApiController

    doorkeeper_for :all
    respond_to :json

    # GET,POST /api/v1/providers/clients
    def clients

    end




  # Find available providers based on specified search parameters
  #
  # Returns an array of CareSearchResult objects
  #
  # Query strategy:
  # 1. Narrow down providers based on the least resource-intensive query options first
  # 2. Then, geo-filter the providers to exclude those outside the coverage area
  #
  def execute

    # First, log the search to the database


    #    This is the kind of query we want to build:
    #
    #    SELECT u.user_id as id
    #      FROM professions_users u on u.user_id = u.id AND
    #      JOIN availabilities a on a.user_id = u.id
    #      JOIN provider_policies pp on pp.user_id = u.id
    #      JOIN users uu on uu.id = u.user_id
    #      WHERE
    #        -- Profession(s). Determined either by provider type or by profession id
    #        u.profession_id in (:profession_ids)
    #        -- Optional rate query
    #        AND pp.cost_per_hour BETWEEN :rate_low AND :rate_high
    #        -- Optional age query
    #        AND uu.date_of_birth BETWEEN :start_dob AND :end_dob
    #        -- Optional gender query
    #        AND uu.gender = :gender
    #        -- Availability query here
    #        AND (
    #          (a.start <= :shift_start_1 AND a.stop >= :shift_stop_1)
    #          OR (a.start <= :shift_start_2 AND a.stop >= :shift_stop_2)
    #          OR (a.start <= :shift_start_3 AND a.stop >= :shift_stop_3)
    #        )
    #        -- Keyword query here
    #        AND (pp.narrative LIKE :keyword OR uu.bio LIKE :keyword)
    #
    #      ORDER BY :sort


    # Geocode the latitude/longitude of the origin_location. The geocoder will
    # return an array.  We put that array into a hash called "search_origin"
    search_origin_latlng = Location.find_latlong_string self.origin_location
    search_origin = {"lat" => search_origin_latlng[0], "long" => search_origin_latlng[1]}

    all_providers_query = "SELECT uu.id as user_id, l.lat, l.long, l.range, 3956 * 2 * ASIN(SQRT( POWER(SIN((:origin_lat -
          abs(l.lat)) * pi()/180 / 2),2) + COS(:origin_lat * pi()/180 ) *
          COS(abs(l.lat) *  pi()/180) * POWER(SIN((:origin_long - l.long) *  pi()/180 / 2), 2) )) as distance
      FROM locations l
      WHERE
        uu.user_type = 'provider' AND
        3956 * 2 * ASIN(SQRT( POWER(SIN((:origin_lat -
      abs(l.lat)) * pi()/180 / 2),2) + COS(:origin_lat * pi()/180 ) *
      COS(abs(l.lat) *  pi()/180) * POWER(SIN((:origin_long - l.long) *  pi()/180 / 2), 2) )) <= COALESCE(l.range, 15)
      "
    @all_providers_results = ActiveRecord::Base.connection.select_all(
          ActiveRecord::Base.send("sanitize_sql_array", [ all_providers_query, { :origin_lat => search_origin["lat"], :origin_long => search_origin["long"] } ] )
        )


    query_params = Hash.new
    sql_query = "SELECT u.user_id as id, l.lat, l.long, l.range, a.start, a.stop, pp.visit_min
      FROM professions_users u
      JOIN availabilities a on a.user_id = u.user_id
      JOIN provider_policies pp on pp.user_id = u.user_id
      JOIN users uu on uu.id = u.user_id
      LEFT JOIN locations l on l.id = uu.location_default_id
      WHERE
        pp.is_valid = 1 AND
        u.profession_id in (:profession_ids)
    "


    if !options[:rate_low].blank? or !options[:rate_high].blank?
      sql_query << " AND pp.cost_per_hour BETWEEN :rate_low AND :rate_high "
      query_params[:rate_low] = options[:rate_low].to_i
      query_params[:rate_high] = options[:rate_high].to_i
    end

    if !options[:age_low].blank? or !options[:age_high].blank?
      sql_query << " AND uu.date_of_birth BETWEEN :age_high AND :age_low "
      query_params[:age_low] = Time.current - options[:age_low].to_i.years
      query_params[:age_high] = Time.current - options[:age_high].to_i.years
    end

    if !options[:gender].blank?
      sql_query << " AND uu.gender = :gender "
      query_params[:gender] = options[:gender]
    end

    if !options[:keyword].blank?
      sql_query << " AND (pp.narrative LIKE :keyword OR uu.bio LIKE :keyword) "
      query_params[:keyword] = options[:keyword]
    end

    query_params[:profession_ids] = self.professions #.join(',')

    date_criteria = []
    #duration_criteria = []

    logger.debug shifts.inspect

    shifts.each_index do |index|

      Rails.logger.debug  self.shifts[index].inspect

      start_key = "shift_start_" + index.to_s
      stop_key = "shift_stop_" + index.to_s
      duration_key = "duration_" + index.to_s

      date_criteria << sprintf("(start <= :%s AND stop >= :%s and pp.visit_min <= :%s)", start_key, stop_key, duration_key)
      #duration_criteria << sprintf("pp.visit_min <= :%s", duration_key)

      query_params[start_key.to_sym] = self.shifts[index].start.getutc.to_formatted_s :mysql_date_time_format
      query_params[stop_key.to_sym] = self.shifts[index].stop.getutc.to_formatted_s :mysql_date_time_format
      query_params[duration_key.to_sym] = self.shifts[index].duration / 60 # convert seconds to minutes

    end

    sql_query << " AND ( "
    sql_query << date_criteria.join(' OR ')
    sql_query << " ) "

    #sql_query << " AND ( "
    #sql_query << duration_criteria.join(' OR ')
    #sql_query << " ) "


    # Execute the SQL query we have constructed, which will return user id,
    # latitude, longitude, range (service radius for provider),
    # availability start and availability end
    @query_results = ActiveRecord::Base.connection.select_all(
      ActiveRecord::Base.send("sanitize_sql_array",[sql_query, query_params] )
    )

    Rails.logger.debug sprintf("%d results returned", @query_results.count)


    # Create an empty array that will contain a filtered subset of providers
    # who are within the appropriate physical proximity
    @final_results =  []

    # Create an empty array of provider IDs.  This array will be used to
    # ensure that we are not populating @final_results with duplicate data
    provider_ids = []


    # Loop through our search results for proximity lookup
    @query_results.each do |a|

      # Make sure the user has a location before doing the proximity lookup
      # Also make sure the @final_results array doesn't already include
      unless a.nil? or a["lat"].nil? or provider_ids.include? a["id"]
        provider_valid = true

        # Calculate the distance (in miles) between the searhc origin and
        # the provider's location
        distance = SearchHelper.haversine a, search_origin

        # If provider has not specified a service radius
        range = (a["range"].nil?) ? 5 : a["range"]

        # Compare calculated distance with provider's configured service radius
        if (distance < range) then
          # Add distance to the search result record
          a["distance"] = distance
        else
          provider_valid = false
          Rails.logger.debug sprintf("Provider %d was %f away from %s.  This is farther than the max range of %f", a["id"], distance, search_origin, range)
        end


        if provider_valid
          # Add this record to the @final_results array
          @final_results << a

          # Add this record to the provider_ids array, ensuring that
          # this provider will only show up once in the search results
          provider_ids << a["id"]
        end

      end
    end

    # Starting record.  Can be used dynamically down the road for paged results
    start = 0

    # Construct a new CareSearchResult object from the given data
    self.results = CareSearchResult.new({
      :care_search_id => self.id,
      :results => self.results,       ### is this circular??? 4/26/12 Noah
      :unqualified_providers => @all_providers_results,
      :start_result => start,
      :end_result => start + @final_results.count
    })

    # Loop through @final_results array and add shift availability details
    # per provider to the search results
    @final_results.each do |u|

      r = CareSearchResultItem.new
      r.provider_id = u["id"]

      # Loop through all shifts originally specified in search criteria
      shifts.each do |shift|

        # Loop through all original query results, which contain shift availability
        # details per provider, and map this info to the search results
        @query_results.each do |a|
          if a["id"] == u["id"] and (a["start"] <= shift.start and a["stop"] >= shift.stop) and ( a["visit_min"].blank? or a["visit_min"].minutes <= shift.duration )
            s = shift.clone
            r.available_shifts.push s
            break
          end
        end
      end

      # Calculate the total percent availability of the provider
      # (i.e., how many shifts out of the shifts specified is the provider
      # available to cover?)
      r.availability_percent = r.available_shifts.count / shifts.count

      self.results.add_result r

    end

    # @todo:
    # By default, we sort by provider availability.
    # However, this should be expanded to recognize the data from the
    # sort option in the refine results form
    self.results.sort_by :availability

    # Save total number of records found
    self.results_count = self.results.count

    # Save search results to the database
    self.results.save!

    # Save search to database
    self.save!

    return self.results

  rescue nil

  end




  end
end
