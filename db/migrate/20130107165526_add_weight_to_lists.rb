class AddWeightToLists < ActiveRecord::Migration
  def change
    add_column :caregiver_tasks, :weight, :integer, :not_null => true, :default => 0
    add_column :patient_statuses, :weight, :integer, :not_null => true, :default => 0
  end
end
