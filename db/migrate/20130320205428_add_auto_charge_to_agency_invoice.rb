class AddAutoChargeToAgencyInvoice < ActiveRecord::Migration
  def change
    add_column :agency_invoices, :auto_charge, :boolean, :not_null => true, :default => 0
  end
end
