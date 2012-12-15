# == Schema Information
#
# Table name: activity_streams
#
#  id                :integer          not null, primary key
#  agency_id         :integer
#  user_id           :integer
#  care_recipient_id :integer
#  stream_type       :string(255)
#  label             :string(255)
#  reference_id      :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class ActivityStreamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
