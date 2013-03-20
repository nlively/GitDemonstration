module Dashboard
  class SettingsController  < DashboardController

    before_filter do
      @settings_options = {
        '' => 'Select one...',
        :agency => 'Agency',
        :users => 'Users',
        :daily_activities => 'Daily Activities',
      }
    end

    def index
      @page_title = "Settings"

      # possible filter params: letter, name

    end

  end
end