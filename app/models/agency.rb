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
#  allowed_users          :integer          default(0)
#

class Agency < ActiveRecord::Base
  include Boomr::HasManyVisitsHelper
  include Boomr::BraintreeCustomer

  has_many :payroll_batches
  has_many :activity_streams
  has_many :users
  has_many :visits
  has_many :care_recipients
  has_many :locations
  has_many :client_invoices

  has_many :agency_invoices
  has_many :agency_invoice_rows, :through => :agency_invoices
  has_many :agency_invoice_payments, :through => :agency_invoices

  belongs_to :location
  belongs_to :subscription_tier

  before_save :ensure_account_number!

  # Disabled because our Braintree account is inactive
  before_save :ensure_customer_record!

  # Find out if this user has an associated Braintree customer profile
  def has_payment_info?
    not self.braintree_customer_id.blank?
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
      Boomr::BraintreeCustomer.attach_braintree_data(self)
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
    self.users.find_by_role(:caregiver).where(:deleted => false, :agency_id =>self.id)
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

  def latest_invoice_number
    client_invoices.empty? ? 0 : client_invoices.order('invoice_number desc').first.invoice_number
  end

  def pending_invoices
    client_invoices.where("status = ?", 'pending')
  end


  def client_invoices_query options

    where = []
    params = []

    unless options[:client_name].blank?
      fuzzy = '%' + options[:client_name] + '%'
      where << 'care_recipients.first_name like ? OR care_recipients.last_name like ?'
      params << fuzzy
      params << fuzzy
    end

    unless options[:invoice_number].blank?
      where << 'invoice_number = ?'
      params << options[:invoice_number].to_i
    end

    unless options[:invoice_date].blank?
      where << 'invoice_date BETWEEN ? AND ?'
      params << options[:invoice_date]
      params << (options[:invoice_date] + 1.day - 1.second)
    end

    unless options[:invoice_status].blank?
      where << 'status = ?'
      params << options[:invoice_status]
    end

    where_str = 'status != ?'
    if where.count > 0
      where_str += sprintf(' AND (%s)', where.join(' OR '))
    end
    client_invoices.includes(:care_recipient).where where_str, 'temporary', *params

  end



  def payroll_batches_query options

    query = 'SELECT DISTINCT pb.id FROM payroll_batches pb '

    joins = []
    where = []
    params = []

    pli_join = 'JOIN payroll_line_items pli ON pli.payroll_batch_id = pb.id'

    unless options[:employee_name].blank?
      fuzzy = '%' + options[:employee_name] + '%'
      where << 'u.first_name like ? OR u.last_name like ?'
      params << fuzzy
      params << fuzzy
      joins << pli_join
      joins << 'JOIN users u ON u.id = pli.user_id'

    end

    unless options[:batch_number].blank?
      where << 'pb.id = ?'
      params << options[:batch_number].to_i
    end

    unless options[:batch_date].blank?
      where << 'v.in_time BETWEEN ? AND ?'
      params << options[:batch_date]
      params << (options[:batch_date] + 1.day - 1.second)
      unless joins.include? pli_join
        joins << pli_join
        joins << 'JOIN visits v on v.payroll_line_item_id = pli.id'
      end
    end

    unless options[:batch_status].blank?
      where << 'pb.status = ?'
      params << options[:batch_status]
    end

    where_str = 'pb.agency_id = ? AND pb.status != ?'
    if where.count > 0
      where_str += sprintf(' AND (%s)', where.join(' OR '))
    end

    query_sql = query + joins.join(' ') + ' WHERE ' + where_str + ' ORDER BY id DESC'

    ids = ActiveRecord::Base.connection.select_all(
      ActiveRecord::Base.send("sanitize_sql_array", [query_sql, self.id, 'temporary', *params] )
    )


    #ids = payroll_batches.includes(:user).where(where_str, 'temporary', *params).select('payroll_batches.id')
    #payroll_batches.includes(:user).where(where_str, 'temporary', *params)

    PayrollBatch.where(:id => ids.map{|i| i['id']})

  end

  def subscription_fee
    fee = subscription_tier.blank? ? 0.0 : subscription_tier.monthly_fee
    monthly_price_override or fee
  end

  # Returns a default credit card on file for a user
  def default_credit_card
    return nil unless self.has_payment_info?

    self.credit_cards.find { |cc| cc.default? }
  end

  def process_payment!

    amount = self.subscription_fee
    cc = self.default_credit_card

    if amount > 0 and not cc.blank?

      result = Braintree::Transaction.sale(
        :amount => amount,
        :customer_id => self.braintree_customer_id,
        :payment_method_token => cc.token
      )

      if result.success?

        payment.status = "COMPLETED"
        payment.save!

        self.next_billing_date = Date.today if self.next_billing_date.blank?
        self.next_billing_date += 1.month
        self.save!

      else

        ex = Exception.new sprintf("Error processing payment with Braintree.")
        Airbrake.notify ex

        return
      end

    end


  end

  def self.with_payment_due

  end

  def self.needing_invoice_generation



  end


end
