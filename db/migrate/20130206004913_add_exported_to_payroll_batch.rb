class AddExportedToPayrollBatch < ActiveRecord::Migration
  def change
    add_column :payroll_batches, :exported, :boolean, :not_null => true, :default => 0
  end
end
