class AddStatusToPayrollLineItem < ActiveRecord::Migration
  def change
    add_column :payroll_line_items, :status, :string, :not_null => true
  end
end
