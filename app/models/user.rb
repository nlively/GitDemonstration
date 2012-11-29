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
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :first_name, :last_name, :date_of_birth, :gender, :profile_photo

  acts_as_authorization_subject  :association_name => :roles, :join_table_name => :roles_users

  has_many :photos
  has_many :notes
  has_many :visits
  belongs_to :agency

  has_many :care_recipients_users
  has_many :care_recipients, :through => :care_recipients_users

  has_attached_file :profile_photo, :styles => {
    :profile => "93x93>"
  }

  def self.authenticate!(username, password)
    return nil if username.blank? || password.blank?

    if (user = User.find_by_email(username))
      return user if user.valid_password?(password)
    end

    nil
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

  def web_service_format

    return {
      :full_name =>full_name,
      :photo_url => profile_photo.url(:profile),
      :id => id,
      :email => email
    }

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

end
