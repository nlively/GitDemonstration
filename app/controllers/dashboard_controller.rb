class DashboardController < ::ApplicationController

  layout 'dashboard'
  before_filter :authenticate_user!

  access_control do
    allow :agency_administrator, :administrator
  end

  def index

  end

end
