# == Schema Information
#
# Table name: check_ins
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  latitude          :integer
#  longitude         :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  session_guid      :string(32)
#  in_out            :boolean
#  care_recipient_id :integer
#  location_id       :integer
#  agency_id         :integer
#

require 'test_helper'

class CheckInTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
