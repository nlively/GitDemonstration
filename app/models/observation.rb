# == Schema Information
#
# Table name: observations
#
#  id         :integer          not null, primary key
#  label      :string(255)
#  weight     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Observation < ActiveRecord::Base
  attr_accessible :label, :weight

  has_many :visits_observations
  has_many :visits, :through => :visits_observations

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
