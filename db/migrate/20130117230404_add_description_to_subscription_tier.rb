class AddDescriptionToSubscriptionTier < ActiveRecord::Migration
  def change
    add_column :subscription_tiers, :description, :text
  end
end
