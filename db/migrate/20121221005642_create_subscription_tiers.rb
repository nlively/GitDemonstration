class CreateSubscriptionTiers < ActiveRecord::Migration
  def change
    create_table :subscription_tiers do |t|
      t.string  :label
      t.decimal :monthly_fee,          :precision => 11, :scale => 2, :default => 0.0
      t.integer :max_users, :not_null => true, :default => 0
      t.timestamps
    end
  end
end
