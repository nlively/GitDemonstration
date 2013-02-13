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

require 'test_helper'

class PayrollLineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
