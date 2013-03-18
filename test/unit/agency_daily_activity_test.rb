# == Schema Information
#
# Table name: agency_daily_activities
#
#  id          :integer          not null, primary key
#  agency_id   :integer
#  original_id :integer
#  label       :string(255)
#  weight      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted     :boolean          default(FALSE)
#

require 'test_helper'

class AgencyDailyActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
