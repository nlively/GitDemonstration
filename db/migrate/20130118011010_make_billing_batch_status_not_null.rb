class MakeBillingBatchStatusNotNull < ActiveRecord::Migration
  def up
    change_column :billing_batches, :status, :string, :not_null => true, :default => 'pending'
  end

  def down
  end
end
