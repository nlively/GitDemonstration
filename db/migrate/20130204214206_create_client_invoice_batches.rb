class CreateClientInvoiceBatches < ActiveRecord::Migration
  def change
    create_table :client_invoice_batches do |t|
      t.integer :agency_id, :not_null => true
      t.string :guid, :not_null => true
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
