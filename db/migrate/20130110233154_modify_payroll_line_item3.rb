class ModifyPayrollLineItem3 < ActiveRecord::Migration
  def up
    remove_column :payroll_line_items, :bill_rate
    remove_column :payroll_line_items, :original_bill_rate
    add_column :payroll_line_items, :pay_rate, :decimal, :precision => 11, :scale => 2, :not_null => true, :default => 0
    add_column :payroll_line_items, :original_pay_rate, :decimal, :precision => 11, :scale => 2, :not_null => true, :default => 0
  end

  def down
  end
end
