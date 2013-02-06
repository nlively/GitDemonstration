module Dashboard::Clients
  class VisitsController < Dashboard::ClientsController

    def index
      @visits = @care_recipient.visits.where(:approved => true).order('in_time desc')
      end

  end
end
