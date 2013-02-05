class AddBatchIdToClientInvoice < ActiveRecord::Migration
  def change
    add_column :client_invoices, :client_invoice_batch_id, :integer, :not_null => true
  end
end
