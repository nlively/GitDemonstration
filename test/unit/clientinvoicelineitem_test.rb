# == Schema Information
#
# Table name: billing_line_items
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

require 'test_helper'

class ClientInvoiceLineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
