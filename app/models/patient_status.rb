# == Schema Information
#
# Table name: patient_statuses
#
#  id         :integer          not null, primary key
#  label      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PatientStatus < ActiveRecord::Base
  has_many :visits_patient_statuses
  has_many :visits, :through => :visits_patient_statuses
end
