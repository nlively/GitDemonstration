module Dashboard
  class ReportsController  < DashboardController

    before_filter do
      @report_types = {
          '' => 'Select one...',
          :billing => 'Billing',
          :payroll => 'Payroll',
      }
    end

    def index
      @page_title = "Reports"

      # possible filter params: letter, name


    end


  end
end