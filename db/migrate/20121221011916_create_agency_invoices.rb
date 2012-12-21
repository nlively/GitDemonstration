class CreateAgencyInvoices < ActiveRecord::Migration
  def change
    create_table :agency_invoices do |t|
      t.integer :agency_id
      t.decimal :total, :precision => 11, :scale => 2, :not_null => true, :default => 0.0
      t.date :invoice_date
      t.date :due_date
      t.date :auto_billing_date
      t.text :notes
      t.integer :status

      t.timestamps
    end
  end
end
