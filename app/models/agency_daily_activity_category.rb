# == Schema Information
#
# Table name: agency_daily_activity_categories
#
#  id          :integer          not null, primary key
#  label       :string(255)
#  original_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  agency_id   :integer
#

class AgencyDailyActivityCategory < ActiveRecord::Base
  belongs_to :agency
  has_many :agency_daily_activities
end
