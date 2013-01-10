class AddOvertimeRatioToAgency < ActiveRecord::Migration
  def change
    add_column :agencies, :overtime_multiplier, :decimal, :precision => 11, :scale => 2, :not_null => true, :default => 1.5
  end
end
