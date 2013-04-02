class AddDurationMinutesToWorkBreak < ActiveRecord::Migration
  def change
    add_column :work_breaks, :duration_minutes, :integer, :not_null => true, :default => 0
  end
end
