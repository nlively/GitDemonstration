# == Schema Information
#
# Table name: users
#
#  id                         :integer          not null, primary key
#  email                      :string(255)      default(""), not null
#  encrypted_password         :string(255)      default(""), not null
#  first_name                 :string(255)
#  last_name                  :string(255)
#  date_of_birth              :datetime
#  gender                     :string(255)
#  reset_password_token       :string(255)
#  reset_password_sent_at     :datetime
#  remember_created_at        :datetime
#  sign_in_count              :integer          default(0)
#  current_sign_in_at         :datetime
#  last_sign_in_at            :datetime
#  current_sign_in_ip         :string(255)
#  last_sign_in_ip            :string(255)
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  profile_photo_file_name    :string(255)
#  profile_photo_content_type :string(255)
#  profile_photo_file_size    :integer
#  profile_photo_updated_at   :datetime
#  agency_id                  :integer
#  settings                   :text
#  default_pay_rate           :decimal(11, 2)   default(0.0)
#  middle_name                :string(255)
#  phone                      :string(255)
#  sms                        :string(255)
#  is_active                  :boolean          default(TRUE)
#  deleted                    :boolean          default(FALSE)
#  location_id                :integer
#  original_email             :string(255)
#  auto_check_out             :boolean          default(TRUE)
#  mapped_client_id           :integer
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
