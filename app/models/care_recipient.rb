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
#

class CareRecipient < ActiveRecord::Base
  has_many :photos
  has_many :notes
  has_many :visits

  belongs_to :agency
  belongs_to :default_location, :class_name => 'Location', :foreign_key => :default_location_id

  has_many :care_recipients_locations, :class_name =>'CareRecipientsLocations', :foreign_key => :care_recipient_id
  has_many :locations, :through => :care_recipients_locations

  has_many :care_recipients_users
  has_many :users, :through => :care_recipients_users

  has_attached_file :profile_photo, :styles => {
    :profile => "93x93>"
  }

  def full_name
    return sprintf '%s %s', first_name, last_name
  end

  def full_name_last_first
    return sprintf '%s, %s', last_name, first_name
  end

   def first_location
     return locations.first unless locations.empty?
   end

  def first_location_id
    return first_location.id unless first_location.nil?
  end

  def address1
    return first_location.street unless first_location.nil?
  end
  def address2
    return sprintf("%s, %s %s",first_location.city, first_location.state, first_location.zip) unless first_location.nil?
  end

  def web_service_format url_base

    return {
      :first_name => first_name,
      :last_name => last_name,
      :full_name =>full_name,
      :full_name_last_first =>full_name_last_first,
      :photo_url => "#{url_base}#{profile_photo.url(:profile)}",
      :id => id,
      :dob => dob,
      :location_id => first_location_id,
      :address1 => address1,
      :address2 => address2
    }

  end

end
