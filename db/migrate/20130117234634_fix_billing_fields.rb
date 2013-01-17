class FixBillingFields < ActiveRecord::Migration
  def up

    change_column :billing_line_items, :hours, :decimal, :precision => 11, :scale => 2, :default => 0.0
    change_column :billing_line_items, :bill_rate, :decimal, :precision => 11, :scale => 2, :default => 0.0
    change_column :billing_line_items, :adjustments, :decimal, :precision => 11, :scale => 2, :default => 0.0
    change_column :billing_line_items, :original_bill_rate, :decimal, :precision => 11, :scale => 2, :default => 0.0
  end

  def down
  end
end
