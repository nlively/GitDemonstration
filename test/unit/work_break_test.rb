# == Schema Information
#
# Table name: work_breaks
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  visit_id         :integer
#  guid             :string(255)
#  in_time          :datetime
#  out_time         :datetime
#  auto_checked_out :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  duration_minutes :integer          default(0)
#

require 'test_helper'

class WorkBreakTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
