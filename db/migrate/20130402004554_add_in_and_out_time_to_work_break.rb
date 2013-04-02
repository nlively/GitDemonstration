class AddInAndOutTimeToWorkBreak < ActiveRecord::Migration
  def change

    rename_table :work_breaks, :work_break_check_ins
    add_column :work_break_check_ins, :work_break_id, :integer, :not_null => true

    create_table :work_breaks do |t|
      t.integer :user_id
      t.integer :visit_id
      t.string :guid
      t.datetime :in_time
      t.datetime :out_time
      t.boolean :auto_checked_out

      t.timestamps
    end
  end
end
