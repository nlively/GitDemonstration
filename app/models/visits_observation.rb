# == Schema Information
#
# Table name: visits_observations
#
#  id             :integer          not null, primary key
#  visit_id       :integer
#  observation_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class VisitsObservation < ActiveRecord::Base
  attr_accessible :observation_id, :visit_id

  belongs_to :observation
  belongs_to :visit

  def timestamp
    created_at.to_formatted_s(:hour_with_minute_meridian)
  end

  def web_service_format
    {
      :label => observation.label,
      :created_at => created_at,
      :date => created_at.to_formatted_s(:mdy),
      :time => created_at.to_formatted_s(:hour_with_minute_meridian)
    }
  end
end
