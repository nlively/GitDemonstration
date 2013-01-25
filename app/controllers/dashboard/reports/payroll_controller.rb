module Dashboard::Reports
  class PayrollController < Dashboard::ReportsController
    include PayrollAndBillingHelper

    before_filter do
      @report_section = :payroll
    end

    def index

      redirect_to dashboard_reports_payroll_batches_path

    end

  end
end
