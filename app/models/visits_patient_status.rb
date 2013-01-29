# == Schema Information
#
# Table name: visits_patient_statuses
#
#  id                :integer          not null, primary key
#  visit_id          :integer
#  patient_status_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class VisitsPatientStatus < ActiveRecord::Base
  belongs_to :visit
  belongs_to :patient_status
  def web_service_format
    {
      :label => patient_status.label,
      :created_at => created_at,
      :date => created_at.to_formatted_s(:mdy),
      :time => created_at.to_formatted_s(:hour_with_minute_meridian)
    }
  end
end
