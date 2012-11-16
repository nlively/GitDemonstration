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
#  agency_id                  :integer
#

class Location < ActiveRecord::Base
  has_many :check_ins
  has_many :care_recipients_locations, :class_name =>'CareRecipientsLocations', :foreign_key => :care_recipient_id
  has_many :care_recipients, :through => :care_recipients_locations

  belongs_to :agency

  has_attached_file :outside_photo, :styles => {
    :profile => "93x93>"
  }

end
