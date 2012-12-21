class AddAgencyBillingFields < ActiveRecord::Migration
  def up
    add_column :locations, :line2, :string
    add_column :agencies, :billing_location_id, :integer

  end

  def down
    remove_column :locations, :line2
    remove_column :agencies, :billing_location_id
  end
end
