# == Schema Information
#
# Table name: payroll_batches
#
#  id           :integer          not null, primary key
#  agency_id    :integer
#  batch_date   :datetime
#  notes        :text
#  period_start :date
#  period_end   :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  status       :string(255)      default("pending")
#  exported     :boolean          default(FALSE)
#

require 'test_helper'

class PayrollBatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
