class AddBrainTreeId < ActiveRecord::Migration
  def self.up
    add_column :agencies, :braintree_customer_id,  :text
  end

  def self.down
    remove_column :agencies, :braintree_customer_id
  end
end
