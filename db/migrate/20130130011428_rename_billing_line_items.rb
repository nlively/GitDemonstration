class RenameBillingLineItems < ActiveRecord::Migration
  def up
    rename_table :billing_line_items, :client_invoice_line_items
  end

  def down
  end
end
