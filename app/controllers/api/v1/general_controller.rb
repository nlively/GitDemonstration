module Api::V1
  class GeneralController < ApiController

    # POST /api/v1/general/keepalive
    def keepalive

      @keepalive = AppKeepAlive.create :operating_system => params[:operating_system], :visit_id => params[:visit_id], :app_version => params[:app_version], :user_id => current_resource_owner.id

      unless params[:visit_id].blank?

        @visit = Visit.find params[:visit_id]
        unless @visit.blank? or @visit.completed?
          @visit.last_keepalive_ping = DateTime.current
          @visit.save!

        end

      end

      render json: { :success => true }

    end

    # GET /api/v1/general/list_data
    def list_data
      client_statuses = PatientStatus.order('weight ASC, label ASC').all.map{|s| {id:s.id,label:s.label}}
      daily_activities = current_resource_owner.agency.agency_daily_activities.where(:deleted => 0).order('weight ASC, label ASC').all.map{|s| {id:s.id,label:s.label,category:s.category_label}}
      observations = Observation.order('weight ASC, label ASC').all.map{|s| {id:s.id,label:s.label}}

      daily_activities_by_category = {}
      daily_activities.each do |a|
        cat = a[:category]
        if daily_activities_by_category[cat].blank?
          daily_activities_by_category[cat] = []
        end
        daily_activities_by_category[cat] << {id:a[:id],label:a[:label]}
      end

      daily_activities_sorted = []
      daily_activities_by_category.each do |k,v|
        daily_activities_sorted << {
          category: k,
          data: v
        }
      end

      render json: {
        client_statuses: client_statuses,
        daily_activities: daily_activities_sorted,
        observations: observations
      }

    end

    # GET /api/v1/general/client_statuses
    # Deprecated as of the 1.1.4 app release, but kept for compatibility with previous releases
    def client_statuses
      render json: PatientStatus.order('weight ASC, label ASC').all.map{|s| {id:s.id,label:s.label}}

    end

    # GET /api/v1/general/daily_activities
    # Deprecated as of the 1.1.4 app release, but kept for compatibility with previous releases
    def daily_activities
      render json: current_resource_owner.agency.agency_daily_activities.where(:deleted => 0).order('weight ASC, label ASC').all.map{|s| {id:s.id,label:s.label}}
    end

    # GET /api/v1/general/observations
    # Deprecated as of the 1.1.4 app release, but kept for compatibility with previous releases
    def observations
      render json: Observation.order('weight ASC, label ASC').all.map{|s| {id:s.id,label:s.label}}
    end

  end
end
