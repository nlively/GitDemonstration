module Dashboard::Reports
  class BillingController < Dashboard::ReportsController

    before_filter do
      @report_section = :billing
    end

    def index

      redirect_to dashboard_reports_billing_batches_path

    end


  end
end
