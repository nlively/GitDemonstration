module Dashboard::Clients
  class ProfileController < Dashboard::ClientsController

    def index
      @page_title = @care_recipient.full_name + ' - Profile'
    end

  end
end
