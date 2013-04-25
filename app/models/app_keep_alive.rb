# == Schema Information
#
# Table name: app_keep_alives
#
#  id               :integer          not null, primary key
#  operating_system :string(255)
#  visit_id         :integer
#  app_version      :string(255)
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class AppKeepAlive < ActiveRecord::Base
  attr_accessible :app_version, :operating_system, :user_id, :visit_id
end
