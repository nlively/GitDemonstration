# == Schema Information
#
# Table name: billing_batches
#
#  id           :integer          not null, primary key
#  agency_id    :integer
#  batch_date   :datetime
#  notes        :text
#  period_start :date
#  period_end   :date
#  status       :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class BillingBatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
