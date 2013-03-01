class RemoveSubscriptionTier < ActiveRecord::Migration
  def change
    drop_table :subscription_tiers
    remove_column :agencies, :subscription_tier_id
  end
end
