# == Schema Information
#
# Table name: payroll_line_items
#
#  id                    :integer          not null, primary key
#  payroll_batch_id      :integer
#  user_id               :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  pay_status            :integer          default(0), not null
#  regular_hours_worked  :decimal(11, 2)   default(0.0)
#  overtime_hours_worked :decimal(11, 2)   default(0.0)
#  overtime_rate         :decimal(11, 2)   default(0.0)
#  pay_rate              :decimal(11, 2)   default(0.0)
#  original_pay_rate     :decimal(11, 2)   default(0.0)
#  status                :string(255)
#

class PayrollLineItem < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  include InvoiceHelper

  belongs_to :payroll_batch
  belongs_to :user
  has_many :visits

  has_many :temp_visits, :class_name => 'Visit', :foreign_key => :temp_payroll_line_item_id

  accepts_nested_attributes_for :visits
  accepts_nested_attributes_for :temp_visits

  before_save :fill_defaults

  def pending?
    self.status == 'temporary' or self.status == :temporary
  end

  def filename
    fn = sprintf '%s detail %s', payroll_batch.batch_number, user.full_name_last_first
    sanitize_filename fn
  end

  def fill_defaults
    self.original_pay_rate = pay_rate if original_pay_rate.blank?
  end

  def overtime_rate_formatted
    number_to_currency( overtime_rate, :unit => "$", :precision => 2 )
  end

  def pay_rate_formatted
    number_to_currency( pay_rate, :unit => "$", :precision => 2 )
  end

  def total_hours
    regular_hours_worked + overtime_hours_worked
  end

  def adjustments
    a = 0.0
    visits.each {|v|a += v.adjustments }
    a
  end

  def total
    visits_total = 0.0
    visits.each {|v|visits_total += v.money_made }
    visits_total + adjustments
  end

  def total_formatted
    number_to_currency( total, :unit => "$", :precision => 2 )
  end

  def adjustments_formatted
    number_to_currency( adjustments, :unit => "$", :precision => 2 )
  end

  def temp_adjustments
    a = 0.0
    temp_visits.each {|v|a += v.adjustments }
    a
  end

  def temp_total
    visits_total = 0.0
    temp_visits.each {|v|visits_total += v.money_made }
    visits_total + temp_adjustments
  end

  def temp_total_formatted
    number_to_currency( temp_total, :unit => "$", :precision => 2 )
  end

  def temp_adjustments_formatted
    number_to_currency( temp_adjustments, :unit => "$", :precision => 2 )
  end

  def self.create_from_visit! visit
    line_item = self.create!({
      :visit => visit, :pay_rate => visit.pay_rate,
      :original_pay_rate => visit.pay_rate,
      :care_recipient_id => visit.care_recipient_id, :user_id => visit.user_id,
      :pay_status => 0
    })

    return line_item
  end


  def change_from_temp_to_saved!
    self.status = :saved
    self.temp_visits.each do |temp_visit|
      Rails.logger.debug temp_visit.inspect
      temp_visit.change_from_temp_to_saved!
    end
    self.save!
  end

  def back_out!
    self.temp_visits.each do |temp_visit|
      temp_visit.temp_payroll_line_item_id=nil
      temp_visit.save!
    end

    self.visits.each do |visit|
      visit.payroll_line_item_id = nil
      visit.save!
    end

    self.delete

  end


  def export! path=nil

    visits_data = []
    visits_data << ['Visit Date', 'Client', 'Hours', 'Pay Rate', 'Adjustments', 'Total']

    self.visits.each do |v|
      visits_data << [ v.in_time.to_formatted_s(:mdy), v.care_recipient.full_name_last_first, v.duration_string, v.pay_rate_formatted, v.adjustments_formatted, v.money_made_formatted ]
    end

    if path.blank?
      path = './' + self.filename + '.csv'
    end

    CSV.open(path, 'w') do |csv|
      visits_data.each do |line|
        csv << line
      end
    end # FasterCSV

    path

  end

end
