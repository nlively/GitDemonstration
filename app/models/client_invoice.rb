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

  def invoice_date_formatted
    invoice_date.to_formatted_s :mdy
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
    fn = sprintf '%s %s', invoice_number_formatted, care_recipient.full_name_last_first
    sanitize_filename fn
  end

  def total_minutes
    minutes = 0.0
        client_invoice_line_items.each do |item|
          minutes += item.minutes
        end

    minutes
  end

  def total_hours
    total_minutes / 60.0
  end


  def total_hours_string
    duration_in_hours total_minutes
  end


  # Deletes an invoice and its associated data
  def back_out!

    self.visits.each {|v| v.client_invoice_line_item_id = nil; v.save!}
    self.client_invoice_line_items.each {|d| d.delete}

    self.delete

  end

  def export! path=nil

    csv_data = []

    csv_data << ['Visit Date', 'Caregiver', 'In', 'Out', 'Hours', 'Bill Rate', 'Adjustments', 'Total']

    self.client_invoice_line_items.each do |cli|
      unless cli.visit.blank?
        cli.visit.client_invoice_line_item_id = cli.id
        cli.visit.bill_rate = cli.bill_rate
        cli.visit.save!

        csv_data << [ cli.visit.in_time.to_formatted_s(:mdy), cli.visit.user.full_name_last_first, cli.visit.in_time_time_only, cli.visit.out_time_time_only, cli.duration_string, cli.bill_rate_formatted, cli.adjustments_formatted, cli.total_formatted ]

      end
    end


    self.status = :pending
    self.exported = true
    self.save!

    if path.blank?
      path = './' + self.filename + '.csv'
    end

    CSV.open(path, 'w') do |csv|
      csv_data.each do |line|
        csv << line
      end
    end # FasterCSV


    path

  end

end
