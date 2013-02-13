# == Schema Information
#
# Table name: visits
#
#  id                          :integer          not null, primary key
#  in_time                     :datetime
#  out_time                    :datetime
#  approved                    :boolean
#  user_id                     :integer
#  care_recipient_id           :integer
#  location_id                 :integer
#  agency_id                   :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  bill_rate                   :decimal(11, 2)   default(0.0)
#  pay_rate                    :decimal(11, 2)   default(0.0)
#  approved_by_user_id         :integer
#  payroll_line_item_id        :integer
#  billable                    :boolean          default(TRUE), not null
#  break_minutes               :integer          default(0)
#  duration_minutes            :integer          default(0)
#  billable_duration_minutes   :integer          default(0)
#  guid                        :string(255)
#  client_invoice_line_item_id :integer
#  adjustments                 :decimal(11, 2)   default(0.0)
#  temp_payroll_line_item_id   :integer
#

class Visit < ActiveRecord::Base

  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::NumberHelper
  include VisitsHelper
  include ResourcesHelper

  before_save :process_pre_save
  after_save :process_after_save

  belongs_to :care_recipient
  belongs_to :user
  belongs_to :location
  belongs_to :agency
  belongs_to :approved_by_user, :class_name => 'User', :foreign_key => :approved_by_user_id
  belongs_to :payroll_line_item
  belongs_to :temp_payroll_line_item, :class_name => 'PayrollLineItem', :foreign_key => :temp_payroll_line_item_id
  belongs_to :client_invoice_line_item

  has_one :client_invoice_line_item


  delegate :payroll_batch, :to => :payroll_line_item, :allow_nil => true
  delegate :client_invoice, :to => :client_invoice_line_item, :allow_nil => true

  has_many :check_ins
  has_many :photos
  has_one :note

  has_many :visits_patient_statuses
  has_many :patient_statuses, :through => :visits_patient_statuses

  has_many :visits_caregiver_tasks
  has_many :caregiver_tasks, :through => :visits_caregiver_tasks

  has_many :visits_observations
  has_many :observations, :through => :visits_observations

  @recalculate_duration = false

  def process_pre_save

    self.guid = UUID.generate if self.guid.blank?

    if (self.bill_rate.blank? or self.bill_rate == 0) and not care_recipient.blank?
      self.bill_rate = care_recipient.default_bill_rate
    end

    if (self.pay_rate.blank? or self.pay_rate == 0) and not user.blank?
      self.pay_rate = user.default_pay_rate
    end

    if completed? or recalculate_duration?
      self.break_minutes = 0 if self.break_minutes.blank?
      self.duration_minutes = rounded_for_billing calculate_duration_minutes(self.in_time, self.out_time)
      self.billable_duration_minutes = self.duration_minutes - rounded_for_billing(self.break_minutes)
    end
  end

  def process_after_save
    if self.approved_changed? and self.approved

      if self.spans_two_days?

        self.split_days!

      end

    end
  end

  def after_approve

  end

  def employee_label
    return (user.nil?) ? 'N/A' : user.full_name_last_first
  end

  def client_label
    return (care_recipient.nil?) ? 'N/A' : care_recipient.full_name_last_first
  end

  def bill_rate_formatted
    number_to_currency( bill_rate, :unit => "$", :precision => 2 )
  end

  def pay_rate_formatted
    number_to_currency( pay_rate, :unit => "$", :precision => 2 )
  end

  def in_time_formatted
    in_time.to_formatted_s(:mdy_with_time) unless in_time.blank?
  end

  def date_only_formatted
    in_time.to_formatted_s :mdy unless in_time.blank?
  end

  def in_time_time_only
    in_time.to_formatted_s :hour_with_minute_meridian unless in_time.blank?
  end

  def out_time_time_only
    out_time.to_formatted_s :hour_with_minute_meridian unless out_time.blank?
  end

  def out_time_formatted
    out_time.to_formatted_s(:mdy_with_time) unless out_time.blank?
  end

  def type
    (completed?) ? :completed : :pending
  end

  def completed?
    return !out_time.blank?
  end

  def billable_overtime_minutes
    if total_hours > 8
      billable_duration_minutes - (8.hours / 60.0)
    else
      0
    end
  end

  def billable_overtime_hours
    billable_overtime_minutes.to_f / 60.0
  end

  def total_hours
    billable_duration_minutes.to_f / 60.0
  end

  def adjustments_formatted
    number_to_currency( adjustments, :unit => "$", :precision => 2 )
  end

  def money_made
    adjustments = self.adjustments or 0.0
    (pay_rate.blank? or total_hours.blank?) ? 0.0 : ((pay_rate * total_hours) + adjustments).round(2)
  end

  def money_made_formatted
    number_to_currency( money_made, :unit => "$", :precision => 2 )
  end

  def duration
    return (out_time.blank?) ? nil : out_time - in_time
  end

  def duration_string
    duration_in_hours duration_minutes
  end

  def date_string
    in_time.to_formatted_s(:mdy)
  end

  def start_to_stop
    in_time.to_formatted_s(:hour_with_minute_meridian).strip + ' to ' + out_time.to_formatted_s(:hour_with_minute_meridian).strip
  end

  def full_date_string
    in_time.to_formatted_s(:full_date)
  end

  def time_string
    sprintf '%s %s-%s', in_time.to_formatted_s(:month_slash_date), in_time.to_formatted_s(:hour_with_minute_meridian_no_space), out_time.to_formatted_s(:hour_with_minute_meridian_no_space)
  end

  def time_only_string
    unless out_time.blank?
      if in_time.hour < 12 and out_time.hour >= 12
        sprintf '%s-%s', in_time.to_formatted_s(:hour_with_minute_meridian_no_space), out_time.to_formatted_s(:hour_with_minute_meridian_no_space)
      else
        sprintf '%s-%s', in_time.to_formatted_s(:hour_with_minute), out_time.to_formatted_s(:hour_with_minute_meridian_no_space)
      end
    end
  end

  def month_name_day_string
    self.in_time.to_formatted_s(:month_name_day)
  end

  def is_over?
    self.out_time < Time.now
  end

  def is_future?
    self.in_time > Time.now
  end

  def spans_two_days?
    not self.in_time.blank? and not self.out_time.blank? and self.in_time.beginning_of_day != self.out_time.beginning_of_day
  end

  def split_days!
    days = (self.out_time.beginning_of_day - self.in_time.beginning_of_day) / 1.day
    original_out_time = self.out_time

    (0..days).each do |offset|
      new_in_time = self.in_time.beginning_of_day + offset.days
      new_out_time = self.in_time.end_of_day + offset.days

      if offset == 0
        self.out_time = new_out_time
        self.recalculate_duration=true
        self.save!

      else
        v = self.dup
        v.in_time = new_in_time
        self.recalculate_duration=true
        v.out_time = (offset == days) ? original_out_time : new_out_time
        v.save!
      end


    end

  end

  def recalculate_duration= value
    @recalculate_duration = value
  end

  def recalculate_duration?
    @recalculate_duration
  end



  def location_label
    return (location.nil?) ? 'N/A' : location.label
  end

  def self.pending_by_agency_and_date_range agency_id, start, stop
    pending.where('agency_id = ? AND in_time BETWEEN ? AND ?', agency_id, start, stop)
  end

  def self.completed_by_agency_and_date_range agency_id, start, stop
    completed.where('agency_id = ? AND in_time BETWEEN ? AND ?', agency_id, start, stop)
  end

  def self.pending
    Visit.where :out_time => nil
  end

  def self.completed
    Visit.where("out_time IS NOT NULL")
  end

  def self.approved
    Visit.where :approved => true
  end

  def self.unapproved
    Visit.where :approved => false
  end



  def web_service_format url_base

    hash = {
      :id => id,
      :in_time => in_time,
      :in_time_fmt_date => in_time.to_formatted_s(:mdy),
      :in_time_fmt_time => in_time.to_formatted_s(:hour_with_minute_meridian),
      :user_id => user.id,
      :user_full_name => user.full_name,
      :user_photo_url => full_url(url_base, user.profile_photo.url(:profile)),
      :care_recipient_id => care_recipient.id,
      :care_recipient_full_name => care_recipient.full_name,
      :care_recipient_full_name_last_first => care_recipient.full_name_last_first,
      :care_recipient_photo_url => full_url(url_base, care_recipient.profile_photo.url(:profile)),
      :location_id => location_id,
      :month => in_time.to_formatted_s(:month_abbrev),
      :day => in_time.to_formatted_s(:day_only),
      :bill_rate => bill_rate,
      :pay_rate => pay_rate,
      :photos => []
    }

    unless self.photos.empty?
      self.photos.each do |p|
        hash[:photos] << p.web_service_format_minimal(url_base)
      end
    end

    unless note.nil?
      hash[:note] = note.note
    end

    if completed?
      hash[:timespan_fmt] = start_to_stop
      hash[:duration_fmt] = duration_string
      hash[:money_made] = money_made.round(2) unless money_made.nil?
    end

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

  def web_service_format_deep url_base
    hash = web_service_format url_base

    hash[:full_date] = self.full_date_string

    hash[:daily_activities] = self.visits_caregiver_tasks.map {|d| d.web_service_format }
    hash[:patient_statuses] = self.visits_patient_statuses.map {|d| d.web_service_format }
    hash[:observations] = self.visits_observations.map {|d| d.web_service_format }

    hash
  end

  def change_from_temp_to_saved!
    if self.payroll_line_item_id.blank?
      self.payroll_line_item_id = self.temp_payroll_line_item_id
      self.save!
    end
  end


end
