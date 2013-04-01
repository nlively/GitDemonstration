# == Schema Information
#
# Table name: agency_daily_activity_categories
#
#  id          :integer          not null, primary key
#  label       :string(255)
#  original_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  agency_id   :integer
#

require 'test_helper'

class AgencyDailyActivityCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
