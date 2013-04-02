class CreateWorkBreaks < ActiveRecord::Migration
  def change
    create_table :work_breaks do |t|

      t.integer  "user_id"
      t.decimal  "latitude",   :precision => 11, :scale => 8
      t.decimal  "longitude",  :precision => 11, :scale => 8
      t.boolean  "in_out"
      t.integer  "visit_id"

      t.timestamps
    end
  end
end
