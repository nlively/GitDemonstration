# == Schema Information
#
# Table name: payroll_line_items
#
#  id                    :integer          not null, primary key
#  payroll_batch_id      :integer
#  user_id               :integer
#  bill_rate             :decimal(11, 2)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  pay_status            :integer          default(0), not null
#  original_bill_rate    :decimal(11, 2)
#  regular_hours_worked  :decimal(11, 2)   default(0.0)
#  overtime_hours_worked :decimal(11, 2)   default(0.0)
#  overtime_rate         :decimal(11, 2)   default(0.0)
#  adjustments           :decimal(11, 2)   default(0.0)
#

class PayrollLineItem < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  belongs_to :payroll_batch
  has_one :visit

  before_save :fill_defaults

  def fill_defaults
    self.original_bill_rate = bill_rate if original_bill_rate.blank?
  end

  def overtime_rate_formatted
    number_to_currency( overtime_rate, :unit => "$", :precision => 2 )
  end

  def bill_rate_formatted
    number_to_currency( bill_rate, :unit => "$", :precision => 2 )
  end

  def total
    (regular_hours_worked * bill_rate) + (overtime_hours_worked * overtime_rate) + adjustments
  end

  def total_formatted
    number_to_currency( total, :unit => "$", :precision => 2 )
  end

  def adjustments_formatted
    number_to_currency( adjustments, :unit => "$", :precision => 2 )
  end

  def self.create_from_visit! visit
    line_item = self.create!({
      :visit => visit, :bill_rate => visit.bill_rate, :pay_rate => visit.pay_rate,
      :original_bill_rate => visit.bill_rate, :original_pay_rate => visit.pay_rate,
      :care_recipient_id => visit.care_recipient_id, :user_id => visit.user_id,
      :pay_status => 0
    })

    return line_item
  end

end
