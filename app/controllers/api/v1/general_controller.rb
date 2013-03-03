module Api::V1
  class GeneralController < ApiController

    def client_statuses
      render json: PatientStatus.order('weight ASC, label ASC').all.map{|s| {id:s.id,label:s.label}}
    end

    def daily_activities
      render json: current_resource_owner.agency.agency_daily_activities.order('weight ASC, label ASC').all.map{|s| {id:s.id,label:s.label}}
    end

    def observations
      render json: Observation.order('weight ASC, label ASC').all.map{|s| {id:s.id,label:s.label}}
    end

  end
end
