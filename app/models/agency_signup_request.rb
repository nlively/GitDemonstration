# == Schema Information
#
# Table name: agency_signup_requests
#
#  id              :integer          not null, primary key
#  agency_name     :string(255)
#  contact_name    :string(255)
#  email           :string(255)
#  website         :string(255)
#  phone           :string(255)
#  ip              :string(255)
#  requested_users :integer
#  agency_id       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class AgencySignupRequest < ActiveRecord::Base
end
