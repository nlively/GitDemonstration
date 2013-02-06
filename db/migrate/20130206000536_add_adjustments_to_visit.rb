class AddAdjustmentsToVisit < ActiveRecord::Migration
  def change
    add_column :visits, :adjustments, :decimal, :precision => 11, :scale => 2, :default => 0.0, :not_null => true
    remove_column :payroll_line_items, :visit_id
  end
end
