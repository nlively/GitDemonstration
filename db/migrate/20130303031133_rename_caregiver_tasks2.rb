class RenameCaregiverTasks2 < ActiveRecord::Migration
  def up
    rename_column :visits_daily_activities, :daily_activity_id, :agency_daily_activity_id
  end

  def down
  end
end
