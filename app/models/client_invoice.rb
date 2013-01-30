# == Schema Information
#
# Table name: client_invoices
#
#  id                :integer          not null, primary key
#  care_recipient_id :integer
#  invoice_number    :integer
#  notes             :text
#  due_date          :datetime
#  invoice_date      :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  agency_id         :integer
#  status            :string(255)      default("pending")
#

class ClientInvoice < ActiveRecord::Base

  belongs_to :agency
  belongs_to :care_recipient

  has_many :client_invoice_line_items
  has_many :visits, :through => :client_invoice_line_items


  def invoice_number_formatted
    invoice_number.to_s.rjust 4, '0'
  end

  # Deletes an invoice and its associated data
  def back_out!

    self.visits.each {|v| v.client_invoice_line_item_id = nil; v.save!}
    self.client_invoice_line_items.each {|d| d.delete}

    self.delete

  end

end
