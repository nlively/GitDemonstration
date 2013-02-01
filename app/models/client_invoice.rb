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
  include ActionView::Helpers::NumberHelper
  include VisitsHelper

  belongs_to :agency
  belongs_to :care_recipient

  has_many :client_invoice_line_items
  has_many :visits, :through => :client_invoice_line_items


  def invoice_number_formatted
    invoice_number.to_s.rjust 4, '0'
  end

  def total_amount
    total = 0.0
    client_invoice_line_items.each{|item| total += item.total}

    total
  end

  def total_amount_formatted
    number_to_currency( total_amount, :unit => "$", :precision => 2 )
  end


  def total_hours
    hours = 0.0
    client_invoice_line_items.each do |item|
      hours += item.hours
    end

    hours
  end


  def total_hours_string
    duration_in_hours(total_hours*60)
  end


  # Deletes an invoice and its associated data
  def back_out!

    self.visits.each {|v| v.client_invoice_line_item_id = nil; v.save!}
    self.client_invoice_line_items.each {|d| d.delete}

    self.delete

  end

end
