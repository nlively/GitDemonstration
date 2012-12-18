class AddMorePayrollFields < ActiveRecord::Migration
  def up
    add_column :visits, :billable, :boolean, :null => false, :default => true
    add_column :payroll_line_items, :pay_status, :integer, :null => false, :default => 0
    add_column :payroll_line_items, :original_bill_rate, :decimal, :precision=>11, :scale=>2
    add_column :payroll_line_items, :original_pay_rate, :decimal, :precision=>11, :scale=>2

    change_column :payroll_line_items, :bill_rate, :decimal, :precision=>11, :scale=>2
    change_column :payroll_line_items, :pay_rate, :decimal, :precision=>11, :scale=>2
  end

  def down
  end
end
