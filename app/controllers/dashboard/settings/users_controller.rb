module Dashboard::Settings
  class UsersController < Dashboard::SettingsController

    before_filter do
      @page_type = :users
    end

    def index
      @page_title = 'User Settings'

    end

  end
end
