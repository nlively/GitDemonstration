# == Schema Information
#
# Table name: client_invoice_batches
#
#  id         :integer          not null, primary key
#  agency_id  :integer
#  guid       :string(255)
#  start_date :datetime
#  end_date   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ClientInvoiceBatch < ActiveRecord::Base

  has_many :client_invoices

  before_save :ensure_guid!

  def ensure_guid!
    self.guid = UUID.generate if self.guid.blank?
  end


  def back_out!
    client_invoices.each {|i| i.back_out! }
    self.delete
  end

end
