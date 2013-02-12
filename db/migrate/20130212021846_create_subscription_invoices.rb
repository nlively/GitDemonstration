class CreateSubscriptionInvoices < ActiveRecord::Migration
  def change
    create_table :subscription_invoices do |t|

      t.integer  :agency_id
      t.integer  :invoice_number,    :unique => true
      t.text     :notes
      t.datetime :due_date
      t.datetime :invoice_date
      t.string   :status, :default => "pending"

      t.timestamps
    end
  end
end
