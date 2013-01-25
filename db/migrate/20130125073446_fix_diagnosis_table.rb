class FixDiagnosisTable < ActiveRecord::Migration
  def up
    rename_table :observations_diagnoses, :observations_diagnosis
  end

  def down
    rename_table :observations_diagnosis, :observations_diagnoses
  end
end
