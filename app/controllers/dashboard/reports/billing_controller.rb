module Dashboard::Reports
  class BillingController < Dashboard::ReportsController

    before_filter do
      @report_section = :billing
    end

    def index

      redirect_to dashboard_reports_billing_invoices_path

    end

    def create

      start_date = params[:start]

    end



  end
end
