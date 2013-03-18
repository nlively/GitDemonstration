class AddPaymentTokenToAgencyInvoicePayments < ActiveRecord::Migration
  def change
    add_column :agency_invoice_payments, :payment_token, :string
    rename_column :agency_invoice_payments, :token, :confirmation_token
  end
end
