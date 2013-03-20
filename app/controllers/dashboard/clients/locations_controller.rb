module Dashboard::Clients
  class LocationsController < Dashboard::ClientsController

    before_filter :prep_data

    def prep_data
      @care_recipient = CareRecipient.find params[:client_id]  unless params[:client_id].blank?
    end

    # GET /dashboard/employees/:client_id/locations
    def index
      @page_title = @care_recipient.full_name + ' - Locations'
      @locations = @care_recipient.locations
    end

    # GET /dashboard/employees/:client_id/locations/new
    def new
      @location = Location.new

    end

    # POST /dashboard/employees/:client_id/locations
    def create
      @location = Location.new params[:location]
      @location.agency = @agency

      if @location.save
        logger.debug @location.inspect
        @care_recipient.locations << @location
        redirect_to dashboard_client_locations_path(@care_recipient), :notice => 'Location has been added'
      else
        render :action => :new, :error =>'There was a problem saving this location'
      end

    end

    # GET /dashboard/employees/:client_id/locations/:id
    def edit
      @location = Location.find params[:id]
    end

    # PUT /dashboard/employees/:client_id/locations/:id
    def update
      @location = Location.find params[:id]

      if @location.save
        redirect_to dashboard_client_locations_path(@care_recipient), :notice => 'Location has been updated'
      else
        render :action => :edit, :error =>'There was a problem saving this location'
      end

    end

    # DELETE /dashboard/employees/:client_id/locations/:id
    def destroy
      @location = Location.find params[:id]

      unless @care_recipient.default_location == @location
        @record = CareRecipientsLocations.find_by_location_id_and_care_recipient_id @location.id, @care_recipient.id

        @record.delete
        redirect_to dashboard_client_locations_path(@care_recipient), :notice => 'Location has been removed from client'
      end

    end

    # POST /dashboard/employees/:client_id/locations/:id/make_default
    def make_default
      @location = Location.find params[:location_id]
      @care_recipient.default_location = @location
      if @care_recipient.save
        redirect_to dashboard_client_locations_path(@care_recipient), :notice => 'Default location has been updated'
      else
        redirect_to dashboard_client_locations_path(@care_recipient), :error => 'There was a problem updating the client''s default location'
      end
    end

  end
end
