class AddStatusToSubscriptionTier < ActiveRecord::Migration
  def change
    add_column :subscription_tiers, :visible, :boolean, :not_null => true, :default => 1
    add_column :subscription_tiers, :active, :boolean, :not_null => true, :default => 1
  end
end
