# == Schema Information
#
# Table name: care_recipients_locations
#
#  id                :integer          not null, primary key
#  care_recipient_id :integer
#  location_id       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class CareRecipientsLocationsTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
