# == Schema Information
#
# Table name: locations
#
#  id                         :integer          not null, primary key
#  street                     :string(255)
#  city                       :string(255)
#  state                      :string(255)
#  zip                        :string(255)
#  latitude                   :integer
#  longitude                  :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  outside_photo_file_name    :string(255)
#  outside_photo_content_type :string(255)
#  outside_photo_file_size    :integer
#  outside_photo_updated_at   :datetime
#

require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
