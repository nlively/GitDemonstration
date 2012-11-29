# == Schema Information
#
# Table name: check_ins
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  latitude   :decimal(11, 8)
#  longitude  :decimal(11, 8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  in_out     :boolean
#  visit_id   :integer
#

require 'test_helper'

class CheckInTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
