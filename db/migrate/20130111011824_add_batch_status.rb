class AddBatchStatus < ActiveRecord::Migration
  def up
    add_column :payroll_batches, :status, :string, :not_null => true, :default => :pending
  end

  def down
    remove_column :payroll_batches, :status
  end
end
