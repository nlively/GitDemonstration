class AddAutoPaymentAttemptsToAgencyInvoice < ActiveRecord::Migration
  def change
    add_column :agency_invoices, :auto_payment_attempts, :integer, :not_null => true, :default => 0
  end
end
