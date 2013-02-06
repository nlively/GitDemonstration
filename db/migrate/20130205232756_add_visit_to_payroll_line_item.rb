class AddVisitToPayrollLineItem < ActiveRecord::Migration
  def change
    add_column :payroll_line_items, :visit_id, :integer
  end
end
