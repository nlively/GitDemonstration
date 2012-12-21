class AddAgencyFields < ActiveRecord::Migration
  def up
    add_column :agencies, :bio, :text
    add_column :agencies, :phone, :string
    add_column :agencies, :status, :integer
    add_column :agencies, :subscription_tier_id, :integer
    add_column :agencies, :next_billing_date, :date
    add_column :agencies, :monthly_price_override, :decimal, :precision => 11, :scale => 2, :not_null => false

    change_table :agencies do |t|
      t.has_attached_file :logo
    end
  end

  def down
  end
end
