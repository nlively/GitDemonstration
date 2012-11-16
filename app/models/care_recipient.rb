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
#

class CareRecipient < ActiveRecord::Base
  has_many :photos
  has_many :notes
  has_many :check_ins
  belongs_to :default_location, :class_name => 'Location', :foreign_key => :default_location_id

  has_many :care_recipients_locations, :class_name =>'CareRecipientsLocations', :foreign_key => :care_recipient_id
  has_many :locations, :through => :care_recipients_locations

  has_attached_file :profile_photo, :styles => {
    :profile => "93x93>"
  }

  def full_name
    return sprintf '%s %s', first_name, last_name
  end
end
