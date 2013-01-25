class CreateVisitsObservations < ActiveRecord::Migration
  def change
    create_table :visits_observations do |t|
      t.integer :visit_id, :not_null => true
      t.integer :observation_id, :not_null => true

      t.timestamps
    end
  end
end
