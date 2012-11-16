class CreateCareRecipientsLocations < ActiveRecord::Migration
  def change
    create_table :care_recipients_locations, :id => false do |t|
      t.integer :care_recipient_id
      t.integer :location_id
      t.timestamps
    end
  end
end
