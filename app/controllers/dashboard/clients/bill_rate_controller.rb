module Dashboard::Clients
  class BillRateController < Dashboard::ClientsController

    before_filter do
      @care_recipient = CareRecipient.find params[:id]
    end


  end
end
