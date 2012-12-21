# == Schema Information
#
# Table name: locations
#
#  id                         :integer          not null, primary key
#  street                     :string(255)
#  city                       :string(255)
#  state                      :string(255)
#  zip                        :string(255)
#  latitude                   :decimal(11, 8)
#  longitude                  :decimal(11, 8)
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  outside_photo_file_name    :string(255)
#  outside_photo_content_type :string(255)
#  outside_photo_file_size    :integer
#  outside_photo_updated_at   :datetime
#  agency_id                  :integer
#  line2                      :string(255)
#

class Location < ActiveRecord::Base
  has_many :visits
  has_many :care_recipients_locations, :class_name =>'CareRecipientsLocations', :foreign_key => :care_recipient_id
  has_many :care_recipients, :through => :care_recipients_locations

  belongs_to :agency

  before_save :geocode

  has_attached_file :outside_photo, :styles => {
    :profile => "93x93>"
  }

  def label
    return street
  end
  def to_lat_long_string
    return sprintf "%f, %f", latitude, longitude
  end

  def formatted_line1
    return street
  end
  def formatted_line2
    return sprintf("%s, %s %s",city, state, zip)
  end

  def to_lat_long_hash
    assign_latlong

    return {
      'latitude' => latitude,
      'longitude' => longitude
    }
  end

  def to_address_string
    label = ""
    label += street unless street.blank?
    label += ", " + city unless city.blank?
    label += ", " + state unless state.blank?
    label += " " + zip unless zip.blank?

    return label
  end

  def to_html
    label = ""
    label += street + "<br />" unless street.blank?
    label += city unless city.blank?
    label += ", " + state unless state.blank?
    label += " " + zip unless zip.blank?

    return label
  end



  def geocode
    #if self.latitude.nil? or self.latitude.empty?
    geo = Geokit::Geocoders::GoogleGeocoder.geocode to_address_string
    Rails.logger.debug to_address_string
    Rails.logger.debug geo.inspect
    if geo.success then
      self.latitude = geo.lat
      self.longitude =  geo.lng
    end
    #end
  end

end
