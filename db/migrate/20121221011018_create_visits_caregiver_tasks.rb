class CreateVisitsCaregiverTasks < ActiveRecord::Migration
  def change
    create_table :visits_caregiver_tasks do |t|
      t.integer :visit_id
      t.integer :caregiver_task_id

      t.timestamps
    end
  end
end
