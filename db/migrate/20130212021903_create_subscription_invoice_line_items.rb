class CreateSubscriptionInvoiceLineItems < ActiveRecord::Migration
  def change
    create_table :subscription_invoice_line_items do |t|

      t.string  :label
      t.decimal  :amount,          :precision => 11, :scale => 2, :default => 0.0
      t.decimal  :adjustments,        :precision => 11, :scale => 2, :default => 0.0
      t.integer  :subscription_invoice_id

      t.timestamps
    end
  end
end
