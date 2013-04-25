# == Schema Information
#
# Table name: visits_daily_activities
#
#  id                       :integer          not null, primary key
#  visit_id                 :integer
#  agency_daily_activity_id :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class VisitsDailyActivity < ActiveRecord::Base
  belongs_to :visit
  belongs_to :agency_daily_activity

  def timestamp
    created_at.to_formatted_s(:hour_with_minute_meridian)
  end

  def web_service_format
    {
      :id => agency_daily_activity.id,
      :label => agency_daily_activity.label,
      :created_at => created_at,
      :date => created_at.to_formatted_s(:mdy),
      :time => created_at.to_formatted_s(:hour_with_minute_meridian)
    }
  end
end
