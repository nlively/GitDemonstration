class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string   "name"
      t.integer  "location_id"
      t.string   "administrative_contact"
      t.string   "website"
      t.string   "email"
      t.timestamps
    end
  end
end
