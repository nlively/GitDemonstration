class CleanUpWorkBreakCheckIns < ActiveRecord::Migration
  def up
    add_column :work_break_check_ins, :auto, :boolean, :not_null => true, :default => 0
    remove_column :work_break_check_ins, :visit_id
  end

  def down
  end
end
