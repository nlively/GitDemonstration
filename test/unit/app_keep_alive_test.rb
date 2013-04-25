# == Schema Information
#
# Table name: app_keep_alives
#
#  id               :integer          not null, primary key
#  operating_system :string(255)
#  visit_id         :integer
#  app_version      :string(255)
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class AppKeepAliveTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
