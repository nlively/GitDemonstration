# == Schema Information
#
# Table name: daily_activity_categories
#
#  id         :integer          not null, primary key
#  label      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DailyActivityCategory < ActiveRecord::Base
  has_many :daily_activities
end
