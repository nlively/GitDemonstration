# == Schema Information
#
# Table name: client_invoices
#
#  id                      :integer          not null, primary key
#  care_recipient_id       :integer
#  invoice_number          :integer
#  notes                   :text
#  due_date                :datetime
#  invoice_date            :datetime
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  agency_id               :integer
#  status                  :string(255)      default("pending")
#  exported                :boolean          default(FALSE)
#  client_invoice_batch_id :integer
#

class ClientInvoice < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  include ApplicationHelper
  include VisitsHelper
  include InvoiceHelper

  belongs_to :agency
  belongs_to :care_recipient
  belongs_to :client_invoice_batch

  has_many :client_invoice_line_items
  has_many :visits, :through => :client_invoice_line_items


  accepts_nested_attributes_for :client_invoice_line_items

  def status_formatted
    invoice_statuses[status.to_sym] unless status.blank?
  end

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

  def filename
    fn = sprintf '%s - %s', invoice_number_formatted, care_recipient.full_name_last_first
    sanitize_filename fn
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

  def export!

    self.client_invoice_line_items.each do |cli|
      unless cli.visit.blank?
        cli.visit.client_invoice_line_item_id = cli.id
        cli.visit.save!
      end
    end

    self.status = :pending
    self.exported = true
    self.save!

  end

end
