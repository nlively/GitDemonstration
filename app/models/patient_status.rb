# == Schema Information
#
# Table name: patient_statuses
#
#  id         :integer          not null, primary key
#  label      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  weight     :integer          default(0)
#

class PatientStatus < ActiveRecord::Base
  has_many :visits_patient_statuses
  has_many :visits, :through => :visits_patient_statuses

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
