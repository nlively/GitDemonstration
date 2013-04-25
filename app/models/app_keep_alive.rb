class AppKeepAlive < ActiveRecord::Base
  attr_accessible :app_version, :operating_system, :user_id, :visit_id
end
