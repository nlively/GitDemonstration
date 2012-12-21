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
#

class Agency < ActiveRecord::Base
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


  def caregivers
    users.find_by_role(:caregiver)
  end


  def unbatched_visits
    approved_visits.where('payroll_line_item_id IS NULL AND billable = ?', true)
  end

  def visits_by_batch batch_id
    visits.where :batch_id => batch_id
  end

  def pending_visits
    visits.where :out_time => nil
  end

  def completed_visits
    visits.where 'out_time IS NOT NULL'
  end

  def approved_visits
    visits.where :approved => true
  end

  def unapproved_visits
    visits.where :approved => false
  end

  def pending_visits_by_date_range start, stop
    pending_visits.where('in_time BETWEEN ? AND ?', start, stop)
  end

  def completed_visits_by_date_range start, stop
    completed_visits.where('in_time BETWEEN ? AND ?', start, stop)
  end

end
