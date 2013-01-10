class ModifyPayrollLineItem < ActiveRecord::Migration
  def change

    add_column :payroll_line_items, :regular_hours_worked, :decimal, :precision => 11, :scale => 2, :not_null => true, :default => 0
    add_column :payroll_line_items, :overtime_hours_worked, :decimal, :precision => 11, :scale => 2, :not_null => true, :default => 0
    add_column :payroll_line_items, :overtime_rate, :decimal, :precision => 11, :scale => 2, :not_null => true, :default => 0
    add_column :payroll_line_items, :adjustments, :decimal, :precision => 11, :scale => 2, :not_null => true, :default => 0

    remove_column :payroll_line_items, :care_recipient_id

  end
end
