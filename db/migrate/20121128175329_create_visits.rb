class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.datetime :in_time
      t.datetime :out_time
      t.boolean :approved
      t.integer :user_id
      t.integer :care_recipient_id
      t.integer :location_id
      t.integer :agency_id

      t.timestamps
    end
  end
end
