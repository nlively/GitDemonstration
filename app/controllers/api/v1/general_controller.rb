module Api::V1
  class GeneralController < ApiController

    def client_statuses
      render json: ClientStatus.all.order('label ASC').map{|s| {id:s.id,label:s.label}}
    end

    def daily_activities
      render json: CaregiverTask.all.order('label ASC').map{|s| {id:s.id,label:s.label}}
    end
  end
end
