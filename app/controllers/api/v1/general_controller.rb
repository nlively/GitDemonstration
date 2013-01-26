module Api::V1
  class GeneralController < ApiController

    def client_statuses
      render json: PatientStatus.order('weight ASC, label ASC').all.map{|s| {id:s.id,label:s.label}}
    end

    def daily_activities
      render json: CaregiverTask.order('weight ASC, label ASC').all.map{|s| {id:s.id,label:s.label}}
    end

    def observations
      render json: Observation.order('weight ASC, label ASC').all.map{|s| {id:s.id,label:s.label}}
    end

  end
end
