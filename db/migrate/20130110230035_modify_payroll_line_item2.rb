class ModifyPayrollLineItem2 < ActiveRecord::Migration
  def up
    remove_column :payroll_line_items, :pay_rate
    remove_column :payroll_line_items, :original_pay_rate
  end
end
