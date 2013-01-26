class RemoveDiagnoses < ActiveRecord::Migration
  def up
    drop_table :diagnoses
    drop_table :observations_diagnosis
  end

  def down
  end
end
