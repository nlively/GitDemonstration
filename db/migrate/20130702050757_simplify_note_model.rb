class SimplifyNoteModel < ActiveRecord::Migration
  def up

    remove_column :notes, :care_recipient_id
    remove_column :notes, :user_id

  end

  def down
  end
end
