class AddAgencyIdToAgencyDailyActivityCategory < ActiveRecord::Migration
  def change
    add_column :agency_daily_activity_categories, :agency_id, :integer, :not_null => true
  end
end
