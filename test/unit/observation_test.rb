# == Schema Information
#
# Table name: observations
#
#  id         :integer          not null, primary key
#  label      :string(255)
#  weight     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ObservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
