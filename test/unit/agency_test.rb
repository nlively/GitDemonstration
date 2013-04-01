# == Schema Information
#
# Table name: agencies
#
#  id                          :integer          not null, primary key
#  name                        :string(255)
#  location_id                 :integer
#  administrative_contact      :string(255)
#  website                     :string(255)
#  email                       :string(255)
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  bio                         :text
#  phone                       :string(255)
#  status                      :integer
#  next_billing_date           :date
#  monthly_price_override      :decimal(11, 2)
#  logo_file_name              :string(255)
#  logo_content_type           :string(255)
#  logo_file_size              :integer
#  logo_updated_at             :datetime
#  billing_location_id         :integer
#  overtime_multiplier         :decimal(11, 2)   default(1.5)
#  account_number              :integer
#  braintree_customer_id       :text
#  allowed_users               :integer          default(0)
#  invoice_last_generated_date :datetime
#  per_user_price_override     :decimal(11, 2)
#  free_users                  :integer          default(0)
#  auto_check_out              :boolean          default(TRUE)
#

require 'test_helper'

class AgencyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
