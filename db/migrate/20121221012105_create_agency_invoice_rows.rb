class CreateAgencyInvoiceRows < ActiveRecord::Migration
  def change
    create_table :agency_invoice_rows do |t|
      t.integer :agency_invoice_id
      t.string :label
      t.integer :quantity, :not_null => true, :default => 1
      t.decimal :unit_price, :precision => 11, :scale => 2, :not_null => true, :default => 0.0
      t.string :notes
      t.string :status

      t.timestamps
    end
  end
end
