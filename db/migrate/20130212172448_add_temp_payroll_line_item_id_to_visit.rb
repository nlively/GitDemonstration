class AddTempPayrollLineItemIdToVisit < ActiveRecord::Migration
  def change
    add_column :visits, :temp_payroll_line_item_id, :integer
  end
end
