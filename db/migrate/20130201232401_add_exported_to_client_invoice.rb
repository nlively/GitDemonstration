class AddExportedToClientInvoice < ActiveRecord::Migration
  def change
    add_column :client_invoices, :exported, :boolean, :not_null => true, :default => 0
  end
end
