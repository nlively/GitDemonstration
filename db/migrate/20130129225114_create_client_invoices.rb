class CreateClientInvoices < ActiveRecord::Migration
  def change
    create_table :client_invoices do |t|
      t.integer :care_recipient_id
      t.integer :invoice_number
      t.text :notes
      t.datetime :due_date
      t.datetime :invoice_date

      t.timestamps
    end

    rename_column :visits, :billing_line_item_id, :client_invoice_line_item_id

    remove_column :billing_line_items, :billing_batch_id
    add_column :billing_line_items, :client_invoice_id, :integer, :not_null => true

    drop_table :billing_batches

  end
end
