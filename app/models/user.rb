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
#

class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :phone
  validates_numericality_of :default_pay_rate, :greater_than => 0.0

  include ActionView::Helpers::NumberHelper
  include ResourcesHelper
  include Boomr::HasManyVisitsHelper
  #include Boomr::WithPhoneNumber

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :first_name, :middle_name, :last_name, :date_of_birth, :gender, :profile_photo,
    :phone, :sms, :default_pay_rate, :settings, :agency_id

  acts_as_authorization_subject  :association_name => :roles, :join_table_name => :roles_users

  serialize :settings, Hash

  has_many :activity_streams
  has_many :photos
  has_many :check_ins
  has_many :notes
  has_many :visits
  has_many :approved_visits, :class_name => 'Visit', :foreign_key => :approved_by_user_id
  belongs_to :agency
  belongs_to :location

  belongs_to :mapped_client, :class_name => 'CareRecipient'

  has_many :work_breaks
  has_many :work_break_check_ins

  has_many :care_recipients_users
  has_many :care_recipients, :through => :care_recipients_users
  has_many :payroll_line_items

  has_many :payroll_batches, :through => :payroll_line_items

  has_attached_file :profile_photo, :styles => {
    :profile => "93x93>",
    :tiny => "50x50>"
  }

  def self.authenticate!(username, password)
    return nil if username.blank? || password.blank?

    if (user = User.find_by_email(username))
      return user if user.valid_password?(password)
    end

    nil
  end

  def active_for_authentication?
    self.is_active? and not self.deleted?
  end

  def full_name
    return sprintf("%s %s", first_name, last_name)
  end

  def full_name_last_first
    return sprintf '%s, %s', last_name, first_name
  end

  def label
    return (first_name.nil?) ? email : full_name
  end

  def last_check_in
    CheckIn.where(:user_id => self.id).order('created_at DESC').first
  end

  def last_check_in_formatted
    last_check_in.created_at.to_formatted_s :mdy_with_time unless last_check_in.blank?
  end

  def default_pay_rate_formatted
    number_to_currency( default_pay_rate, :unit => "$", :precision => 2 )
  end

  def default_overtime_rate
    default_pay_rate * agency.overtime_multiplier
  end

  def web_service_format url_base

    hash = {
      :id => id,
      :full_name => full_name,
      :full_name_last_first => full_name_last_first,
      :first_name => first_name,
      :last_name => last_name,
      :middle_name => middle_name,
      :photo_url => full_url(url_base, profile_photo.url(:profile)),
      :email => email,
      :phone => phone,
      :sms   => sms
    }

    unless agency.nil?
      hash[:agency_name] = agency.name
    end

    hash

  end

  def scramble_email!

    self.email = UUID.generate + ':' + self.email
    self.save!

  end


  # Find and return all admin-level users
  def self.administrators
    self.find_by_role(:administrator)
  end

  # Find and return all caregivers
  def self.caregivers
    self.find_by_role(:caregiver)
  end

  # Find and return all users matching the given role
  def self.find_by_role(role)
    r = Role.find_by_name(role)
    r.users unless r.nil?
  end

  def self.valid_password? password
      true unless password.blank? or password.length < 6
    end

end
