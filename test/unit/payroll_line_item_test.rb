# == Schema Information
#
# Table name: payroll_line_items
#
#  id                 :integer          not null, primary key
#  payroll_batch_id   :integer
#  care_recipient_id  :integer
#  user_id            :integer
#  bill_rate          :decimal(11, 2)
#  pay_rate           :decimal(11, 2)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  pay_status         :integer          default(0), not null
#  original_bill_rate :decimal(11, 2)
#  original_pay_rate  :decimal(11, 2)
#

require 'test_helper'

class PayrollLineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
