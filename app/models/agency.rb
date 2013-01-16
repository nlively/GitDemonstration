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
#  bio                    :text
#  phone                  :string(255)
#  status                 :integer
#  subscription_tier_id   :integer
#  next_billing_date      :date
#  monthly_price_override :decimal(11, 2)
#  logo_file_name         :string(255)
#  logo_content_type      :string(255)
#  logo_file_size         :integer
#  logo_updated_at        :datetime
#  billing_location_id    :integer
#  overtime_multiplier    :decimal(11, 2)   default(1.5)
#  account_number         :integer
#

class Agency < ActiveRecord::Base
  include Boomr::HasManyVisitsHelper

  has_many :payroll_batches
  has_many :activity_streams
  has_many :users
  has_many :visits
  has_many :care_recipients
  has_many :locations

  has_many :agency_invoices
  has_many :agency_invoice_rows, :through => :agency_invoices
  has_many :agency_invoice_payments, :through => :agency_invoices

  belongs_to :location
  belongs_to :subscription_tier

  before_save :ensure_account_number


  def ensure_account_number
    if account_number.blank?
      self.account_number = Agency.generate_unique_account_number
    end
  end

  def self.generate_unique_account_number
    account_number = nil
    begin
      account_number = Random.new.rand(1111111..9999999)
    end while Agency.find_all_by_account_number(account_number).count > 0

    account_number
  end


  def caregivers
    users.find_by_role(:caregiver)
  end

  def max_users
    if subscription_tier.blank?
      5
    else
      subscription_tier.max_users
    end
  end


end
