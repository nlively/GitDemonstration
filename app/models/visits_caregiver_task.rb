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

  def timestamp
    created_at.to_formatted_s(:hour_with_minute_meridian)
  end

  def web_service_format
    {
      :label => caregiver_task.label,
      :created_at => created_at,
      :date => created_at.to_formatted_s(:mdy),
      :time => created_at.to_formatted_s(:hour_with_minute_meridian)
    }
  end
end
