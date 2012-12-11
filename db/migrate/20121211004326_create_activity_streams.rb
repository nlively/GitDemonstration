class CreateActivityStreams < ActiveRecord::Migration
  def change
    create_table :activity_streams do |t|
      t.integer :agency_id
      t.integer :user_id
      t.integer :care_recipient_id
      t.string :stream_type
      t.string :label
      t.integer :reference_id

      t.timestamps
    end
  end
end
