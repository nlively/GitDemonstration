# == Schema Information
#
# Table name: visits
#
#  id                  :integer          not null, primary key
#  in_time             :datetime
#  out_time            :datetime
#  approved            :boolean
#  user_id             :integer
#  care_recipient_id   :integer
#  location_id         :integer
#  agency_id           :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  bill_rate           :decimal(11, 2)   default(0.0)
#  pay_rate            :decimal(11, 2)   default(0.0)
#  approved_by_user_id :integer
#

require 'test_helper'

class VisitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
