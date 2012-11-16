class DropAndRecreateCareRecpientsLocations < ActiveRecord::Migration
  def up
    drop_table :care_recipients_locations

    create_table :care_recipients_locations do |t|
      t.integer :care_recipient_id
      t.integer :location_id
      t.timestamps
    end
  end

  def down
  end
end
