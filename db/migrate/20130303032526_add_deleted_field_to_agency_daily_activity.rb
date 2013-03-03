class AddDeletedFieldToAgencyDailyActivity < ActiveRecord::Migration
  def change
    add_column :agency_daily_activities, :deleted, :boolean, :not_null => TRUE, :default => 0
  end
end
