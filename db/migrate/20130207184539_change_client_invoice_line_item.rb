class ChangeClientInvoiceLineItem < ActiveRecord::Migration
  def up

    add_column :client_invoice_line_items, :minutes, :integer, :not_null => true, :default => 0
    remove_column :client_invoice_line_items, :hours

    ClientInvoiceLineItem.all.each do |line_item|
      unless line_item.visit_id.blank?
        visit = Visit.find line_item.visit_id
        line_item.minutes = visit.billable_duration_minutes
        line_item.save!
      end
    end

  end

  def down
    add_column :client_invoice_line_items, :hours, :integer, :not_null => true, :default => 0
    remove_column :client_invoice_line_items, :minutes
  end
end
