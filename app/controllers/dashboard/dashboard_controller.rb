module Dashboard
  class DashboardController < ::ApplicationController

    before_filter :authenticate_user!


  end
end