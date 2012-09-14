class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.integer :care_recipient_id
      t.integer :note_id

      t.timestamps
    end
  end
end
