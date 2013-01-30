class AddStatusToClientInvoice < ActiveRecord::Migration
  def change
    add_column :client_invoices, :status, :string, :not_null => true, :default => 'pending'
  end
end
