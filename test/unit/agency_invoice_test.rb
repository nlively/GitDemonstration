# == Schema Information
#
# Table name: agency_invoices
#
#  id                    :integer          not null, primary key
#  agency_id             :integer
#  total                 :decimal(11, 2)   default(0.0)
#  invoice_date          :date
#  due_date              :date
#  auto_billing_date     :date
#  notes                 :text
#  status                :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  auto_payment_attempts :integer          default(0)
#  auto_charge           :boolean          default(FALSE)
#

require 'test_helper'

class AgencyInvoiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
