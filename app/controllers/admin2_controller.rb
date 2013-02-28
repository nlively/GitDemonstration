class Admin2Controller < ::ApplicationController

  layout 'dashboard'
  before_filter :authenticate_user!

  access_control do
    allow :administrator
  end


end
