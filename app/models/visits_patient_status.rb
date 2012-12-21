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
end
