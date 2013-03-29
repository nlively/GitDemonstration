# == Schema Information
#
# Table name: care_recipients
#
#  id                         :integer          not null, primary key
#  first_name                 :string(255)
#  last_name                  :string(255)
#  dob                        :datetime
#  default_location_id        :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  profile_photo_file_name    :string(255)
#  profile_photo_content_type :string(255)
#  profile_photo_file_size    :integer
#  profile_photo_updated_at   :datetime
#  agency_id                  :integer
#  default_bill_rate          :decimal(11, 2)   default(0.0)
#  middle_name                :string(255)
#  gender                     :string(255)
#  phone                      :string(255)
#  sms                        :string(255)
#  is_company                 :boolean          default(FALSE)
#  company_name               :string(255)
#

require 'test_helper'

class CareRecipientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
