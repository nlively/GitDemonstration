class RemoveAdjustmentsFromPayrollLineItem < ActiveRecord::Migration
  def up
    remove_column :payroll_line_items, :adjustments
  end

  def down
  end
end
