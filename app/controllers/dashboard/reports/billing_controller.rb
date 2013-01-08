module Dashboard::Reports
  class BillingController < Dashboard::ReportsController

    before_filter do
      @agency = current_user.agency
    end

    def index

    end


  end
end
