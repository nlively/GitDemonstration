class CreateAgencyDailyActivities < ActiveRecord::Migration
  def change
    create_table :agency_daily_activities do |t|
      t.integer :agency_id
      t.integer :original_id
      t.string :label
      t.integer :weight

      t.timestamps
    end



  end
end
