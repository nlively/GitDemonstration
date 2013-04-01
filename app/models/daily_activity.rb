# == Schema Information
#
# Table name: daily_activities
#
#  id                         :integer          not null, primary key
#  label                      :string(255)
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  weight                     :integer          default(0)
#  daily_activity_category_id :integer
#

class DailyActivity < ActiveRecord::Base
  #has_many :visits_daily_activities
  #has_many :visits, :through => :visits_daily_activities

  belongs_to :daily_activity_category

  def timestamp
    created_at.to_formatted_s(:hour_with_minute_meridian)
  end

  def web_service_format
    {
      :label => label,
      :created_at => created_at,
      :date => created_at.to_formatted_s(:mdy),
      :time => created_at.to_formatted_s(:hour_with_minute_meridian)
    }
  end
end
