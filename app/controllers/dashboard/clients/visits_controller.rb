module Dashboard::Clients
  class VisitsController < Dashboard::ClientsController

    def index
      @visits = @care_recipient.visits.where(:approved => true).order('in_time desc')
      @page_title = @care_recipient.full_name + ' - Visits'
      end

  end
end
