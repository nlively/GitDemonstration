module Dashboard::Clients
  class VisitsController < Dashboard::ClientsController

    def index
      @visits = @care_recipient.visits.order('in_time desc')
      end

  end
end
