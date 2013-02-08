module Dashboard
  class SettingsController  < DashboardController

    before_filter do
      @settings_options = {
        '' => 'Select one...',
        :agency => 'Agency',
        :users => 'Users'
      }
    end

    def index
      @page_title = "Settings"

      # possible filter params: letter, name

    end

  end
end