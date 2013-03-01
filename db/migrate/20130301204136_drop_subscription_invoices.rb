class DropSubscriptionInvoices < ActiveRecord::Migration
  def up
    drop_table :subscription_invoice_line_items
    drop_table :subscription_invoices
  end

  def down
  end
end
