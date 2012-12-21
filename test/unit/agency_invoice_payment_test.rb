# == Schema Information
#
# Table name: agency_invoice_payments
#
#  id                :integer          not null, primary key
#  agency_invoice_id :integer
#  payment_method    :string(255)
#  amount            :decimal(11, 2)   default(0.0)
#  date              :datetime
#  status            :integer
#  token             :string(255)
#  notes             :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class AgencyInvoicePaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
