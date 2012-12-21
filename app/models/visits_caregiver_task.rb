# == Schema Information
#
# Table name: visits_caregiver_tasks
#
#  id                :integer          not null, primary key
#  visit_id          :integer
#  caregiver_task_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class VisitsCaregiverTask < ActiveRecord::Base
  belongs_to :visit
  belongs_to :caregiver_task
end
