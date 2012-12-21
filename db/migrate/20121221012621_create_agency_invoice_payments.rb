class CreateAgencyInvoicePayments < ActiveRecord::Migration
  def change
    create_table :agency_invoice_payments do |t|
      t.integer :agency_invoice_id
      t.string :payment_method
      t.decimal :amount, :precision => 11, :scale => 2, :not_null => true, :default => 0.0
      t.datetime :date
      t.integer :status
      t.string :token
      t.text :notes

      t.timestamps
    end
  end
end
