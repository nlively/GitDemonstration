# == Schema Information
#
# Table name: subscription_tiers
#
#  id          :integer          not null, primary key
#  label       :string(255)
#  monthly_fee :decimal(11, 2)   default(0.0)
#  max_users   :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#  visible     :boolean          default(TRUE)
#  active      :boolean          default(TRUE)
#

require 'test_helper'

class SubscriptionTierTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
