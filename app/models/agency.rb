# == Schema Information
#
# Table name: agencies
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  location_id            :integer
#  administrative_contact :string(255)
#  website                :string(255)
#  email                  :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Agency < ActiveRecord::Base
  has_many :users
  has_many :check_ins
  has_many :care_recipients
  has_many :locations

  belongs_to :location
end
