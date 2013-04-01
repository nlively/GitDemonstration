class CreateAgencyDailyActivityCategories < ActiveRecord::Migration
  def change
    create_table :agency_daily_activity_categories do |t|
      t.string :label
      t.integer :original_id

      t.timestamps
    end


    add_column :agency_daily_activities, :agency_daily_activity_category_id, :integer

  end
end
