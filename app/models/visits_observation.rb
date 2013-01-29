class VisitsObservation < ActiveRecord::Base
  attr_accessible :observation_id, :visit_id

  belongs_to :observation
  belongs_to :visit

  def web_service_format
    {
      :label => observation.label,
      :created_at => created_at,
      :date => created_at.to_formatted_s(:mdy),
      :time => created_at.to_formatted_s(:hour_with_minute_meridian)
    }
  end
end
