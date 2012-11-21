module Dashboard::Clients
  class CaregiversController < Dashboard::ClientsController

    before_filter do
      @care_recipient = CareRecipient.find params[:id]
    end

    def index

    end

  end
end
