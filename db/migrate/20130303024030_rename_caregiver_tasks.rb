class RenameCaregiverTasks < ActiveRecord::Migration
  def up
    rename_table :caregiver_tasks, :daily_activities
    rename_column :visits_caregiver_tasks, :caregiver_task_id, :daily_activity_id
    rename_table :visits_caregiver_tasks, :visits_daily_activities

    Agency.all.each do |agency|
      agency.populate_daily_activities
    end

    VisitsDailyActivity.all.each do |vda|

      agency_daily_activity = AgencyDailyActivity.where(:agency_id => vda.visit.agency_id, :original_id => vda.daily_activity_id).first

      vda.daily_activity_id = agency_daily_activity.id
      vda.save!

    end

  end

  def down
  end
end
