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
#  email                      :string(255)
#  encrypted_password         :string(255)      default(""), not null
#  reset_password_token       :string(255)
#  reset_password_sent_at     :datetime
#  remember_created_at        :datetime
#  sign_in_count              :integer          default(0)
#  current_sign_in_at         :datetime
#  last_sign_in_at            :datetime
#  current_sign_in_ip         :string(255)
#  last_sign_in_ip            :string(255)
#

class CareRecipient < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me
  include ActionView::Helpers::NumberHelper
  include ResourcesHelper

  validates_presence_of :phone, :dob, :default_location_id
  validates_numericality_of :default_bill_rate, :greater_than => 0.0

  #include Boomr::WithPhoneNumber

  has_many :activity_streams
  has_many :photos
  has_many :notes
  has_many :visits

  has_one :mapped_user, :class_name => 'User', :foreign_key => :mapped_client_id

  belongs_to :agency
  belongs_to :default_location, :class_name => 'Location', :foreign_key => :default_location_id

  has_many :care_recipients_locations, :class_name =>'CareRecipientsLocations', :foreign_key => :care_recipient_id
  has_many :locations, :through => :care_recipients_locations

  has_many :care_recipients_users
  has_many :users, :through => :care_recipients_users

  before_save :process_location

  #before_create do
  #  if email.blank?
  #    email = 'client' +  UUID.generate + '@boomr.com'
  #    password = 'Dnk7VbcQqb35wGr'
  #  end
  #end

  has_attached_file :profile_photo, :styles => {
      :profile => "93x93>",
      :tiny => "50x50>"
  }

  def self.authenticate!(email, password)
    return nil if email.blank? || password.blank?

    if (care_recipient = CareRecipient.find_by_email(email))
      return care_recipient if care_recipient.valid_password?(password)
    end

    nil
  end

  def active_for_authentication?
    self.is_active? and not self.deleted?
  end

  def default_bill_rate_formatted
    number_to_currency( default_bill_rate, :unit => "$", :precision => 2 )
  end

  def full_name
    return (is_company?) ? company_name : sprintf('%s %s', first_name, last_name)
  end

  def full_name_last_first
    return (is_company?) ? company_name : sprintf('%s, %s', last_name, first_name)
  end

  def first_location
    return locations.first unless locations.empty?
  end

  def address1
    return first_location.formatted_line1 unless first_location.nil?
  end
  def address2
    return first_location.formatted_line2 unless first_location.nil?
  end

  def web_service_format url_base, location=nil
    location = first_location if location.nil?

    hash = {
        :first_name => first_name,
        :last_name => last_name,
        :company_name => company_name,
        :full_name => full_name,
        :full_name_last_first =>full_name_last_first,
        :photo_url => full_url(url_base, profile_photo.url(:profile)),
        :phone => phone,
        :sms => sms,
        :id => id,
        :dob => dob
    }

    unless location.nil?
      hash[:location_id] = location.id
      hash[:latitude] = location.latitude
      hash[:longitude] = location.longitude
      hash[:address_string] = location.to_address_string
      hash[:address1] = location.formatted_line1
      hash[:address2] = location.formatted_line2
    end

    hash

  end

  def open_visits
    visits.where 'out_time IS NULL'
  end

  def completed_visits
    visits.where 'out_time IS NOT NULL'
  end


  def process_location

    if self.default_location.nil?
      if self.locations.count > 0
        self.default_location = self.locations.first
      end
    else
      unless self.locations.include? self.default_location
        self.locations << self.default_location
      end
    end

  end


end
