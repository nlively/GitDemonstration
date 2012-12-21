# == Schema Information
#
# Table name: caregiver_tasks
#
#  id         :integer          not null, primary key
#  label      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CaregiverTask < ActiveRecord::Base
  has_many :visits_caregiver_tasks
  has_many :visits, :through => :visits_caregiver_tasks
end
