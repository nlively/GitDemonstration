class AddPriceModifierFieldsToAgency < ActiveRecord::Migration
  def change
    add_column :agencies, :invoice_last_generated_date, :datetime
    add_column :agencies, :per_user_price_override, :decimal, :precision => 11, :scale => 2, :null => true
    add_column :agencies, :free_users, :integer, :not_null => true, :default => 0
  end
end
