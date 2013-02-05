# == Schema Information
#
# Table name: client_invoice_batches
#
#  id         :integer          not null, primary key
#  agency_id  :integer
#  guid       :string(255)
#  start_date :datetime
#  end_date   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ClientInvoiceBatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
