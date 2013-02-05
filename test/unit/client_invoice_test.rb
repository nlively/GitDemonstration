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

require 'test_helper'

class ClientInvoiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
