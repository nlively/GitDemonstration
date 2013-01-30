class AddAgencyIdToClientInvoice < ActiveRecord::Migration
  def change
    add_column :client_invoices, :agency_id, :integer, :not_null => true
  end
end
