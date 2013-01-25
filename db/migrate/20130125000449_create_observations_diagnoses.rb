class CreateObservationsDiagnoses < ActiveRecord::Migration
  def change
    create_table :observations_diagnoses do |t|
      t.integer :observation_id
      t.integer :diagnosis_id

      t.timestamps
    end
  end
end
