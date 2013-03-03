# == Schema Information
#
# Table name: visits_caregiver_tasks
#
#  id                :integer          not null, primary key
#  visit_id          :integer
#  caregiver_task_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class VisitsDailiyActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
