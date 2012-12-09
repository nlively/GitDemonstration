module Dashboard::Clients
  class VisitsController < Dashboard::ClientsController

    before_filter do
      @care_recipient = CareRecipient.find params[:id]
    end

    def index
      @visits = @care_recipient.visits.order('in_time desc')
      end

  end
end
