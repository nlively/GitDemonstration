class AddVisitIdToClientInvoiceLineItem < ActiveRecord::Migration
  def change
    add_column :client_invoice_line_items, :visit_id, :integer
  end
end
