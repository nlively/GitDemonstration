class CreateCareRecipients < ActiveRecord::Migration
  def change
    create_table :care_recipients do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :dob
      t.integer :default_location_id

      t.timestamps
    end
  end
end
