class CreateVisitsPatientStatuses < ActiveRecord::Migration
  def change
    create_table :visits_patient_statuses do |t|
      t.integer :visit_id
      t.integer :patient_status_id

      t.timestamps
    end
  end
end
