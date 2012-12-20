class CreateCaregiverTasks < ActiveRecord::Migration
  def change
    create_table :caregiver_tasks do |t|
      t.string :label

      t.timestamps
    end
  end
end
