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
#  braintree_customer_id  :text
#

class Agency < ActiveRecord::Base
  include Boomr::HasManyVisitsHelper
  include Boomr::BraintreeCustomer

  has_many :payroll_batches
  has_many :billing_batches
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

  before_save :ensure_account_number!
  # Disabled because our Braintree account is inactive
  #before_save :ensure_customer_record!

  # Find out if this user has an associated Braintree customer profile
  def has_payment_info?
    !!self.braintree_customer_id
  end

  def ensure_customer_record!
    unless has_payment_info? or Rails.env.test?
      ensure_customer_record
      save unless self.braintree_customer_id.blank?
    end
  end

  def ensure_customer_record
    unless has_payment_info?

      unless name.blank? or email.blank?
        result = Braintree::Customer.create(
          :company => self.name,
          :email => self.email,
          :website => self.website,
          :phone => self.phone
        )

        if result.success?
          self.braintree_customer_id = result.customer.id
        end
      end
    end
  end

  def ensure_account_number!
    if account_number.blank?
      self.account_number = Agency.generate_unique_account_number
    end
  end

  def reset_braintree_info!
    self.braintree_customer_id=nil
    self.save!
  end

  # Attach Braintree customer data to the object
  def with_braintree_data!
    if self.has_payment_info?
      BraintreeCustomer.attach_braintree_data(self)
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

  def subscription_label
    subscription_tier.blank? ? 'n/a' : subscription_tier.label
  end

  def subscription_label_extended
    subscription_tier.blank? ? 'n/a' : sprintf("%s (up to %s)", subscription_tier.label, subscription_tier.max_users_formatted)
  end


end
