class CreateDailyActivityCategories < ActiveRecord::Migration
  def change
    create_table :daily_activity_categories do |t|
      t.string :label

      t.timestamps
    end


    add_column :daily_activities, :daily_activity_category_id, :integer

  end
end
