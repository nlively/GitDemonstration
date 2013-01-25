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

      # possible filter params: letter, name


    end


  end
end