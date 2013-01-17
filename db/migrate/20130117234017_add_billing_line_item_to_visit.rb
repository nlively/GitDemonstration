class AddBillingLineItemToVisit < ActiveRecord::Migration
  def change
    add_column :visits, :billing_line_item_id, :integer
  end
end
