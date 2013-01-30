# == Schema Information
#
# Table name: client_invoice_line_items
#
#  id                 :integer          not null, primary key
#  care_recipient_id  :integer
#  pay_status         :integer
#  hours              :decimal(11, 2)   default(0.0)
#  bill_rate          :decimal(11, 2)   default(0.0)
#  adjustments        :decimal(11, 2)   default(0.0)
#  original_bill_rate :decimal(11, 2)   default(0.0)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  client_invoice_id  :integer
#

class ClientInvoiceLineItem < ActiveRecord::Base

  include ActionView::Helpers::NumberHelper

  belongs_to :client_invoice
  belongs_to :care_recipient
  has_one :visit

  before_save :fill_defaults

  def fill_defaults
    self.original_bill_rate = bill_rate if original_bill_rate.blank?
  end

  def bill_rate_formatted
    number_to_currency( bill_rate, :unit => "$", :precision => 2 )
  end

  def total
    (hours * bill_rate) + adjustments
  end

  def total_formatted
    number_to_currency( total, :unit => "$", :precision => 2 )
  end

  def adjustments_formatted
    number_to_currency( adjustments, :unit => "$", :precision => 2 )
  end

end
