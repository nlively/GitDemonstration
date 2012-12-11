# == Schema Information
#
# Table name: visits
#
#  id                  :integer          not null, primary key
#  in_time             :datetime
#  out_time            :datetime
#  approved            :boolean
#  user_id             :integer
#  care_recipient_id   :integer
#  location_id         :integer
#  agency_id           :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  bill_rate           :decimal(11, 2)
#  pay_rate            :decimal(11, 2)
#  approved_by_user_id :integer
#

class Visit < ActiveRecord::Base

  include ActionView::Helpers::DateHelper
  include VisitsHelper

  belongs_to :care_recipient
  belongs_to :user
  belongs_to :location
  belongs_to :agency
  belongs_to :approved_by_user, :class_name => 'User', :foreign_key => :approved_by_user_id

  has_many :activity_streams
  has_many :check_ins
  has_many :photos

  def employee_label
    return (user.nil?) ? 'N/A' : user.full_name_last_first
  end

  def client_label
    return (care_recipient.nil?) ? 'N/A' : care_recipient.full_name_last_first
  end

  def in_time_formatted
    in_time.to_formatted_s(:mdy_with_time) unless in_time.blank?
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

  def total_hours
    return (out_time - in_time) / 1.hour
  end

  def duration
    return (out_time.blank?) ? nil : out_time - in_time
  end

  def duration_string
    #distance_of_time_in_words(duration) unless duration.nil?
    duration_in_hours in_time, out_time
  end

  def date_string
    in_time.to_formatted_s(:mdy)
  end

  def start_to_stop
    in_time.to_formatted_s(:hour_with_minute_meridian) + ' to ' + out_time.to_formatted_s(:hour_with_minute_meridian)
  end

  def full_date_string
    in_time.to_formatted_s(:full_date)
  end

  def time_string
    sprintf '%s %s-%s', in_time.to_formatted_s(:month_slash_date), in_time.to_formatted_s(:hour_with_minute_meridian_no_space), out_time.to_formatted_s(:hour_with_minute_meridian_no_space)
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
      :user_photo_url => "#{url_base}#{user.profile_photo.url(:profile)}",
      :care_recipient_id => care_recipient.id,
      :care_recipient_full_name => care_recipient.full_name,
      :care_recipient_photo_url => "#{url_base}#{care_recipient.profile_photo.url(:profile)}",
      :location_id => location_id,
      :month => in_time.to_formatted_s(:month_abbrev),
      :day => in_time.to_formatted_s(:day_only),
      :bill_rate => bill_rate,
      :pay_rate => pay_rate
    }

    if completed?
      hash[:timespan_fmt] = start_to_stop
      hash[:duration_fmt] = duration_string
      hash[:money_made] = pay_rate * total_hours
    end

    unless location.nil?
      hash[:location_id] = location.id
      hash[:latitude] = location.latitude
      hash[:longitude] = location.longitude
      hash[:address_string] = location.to_address_string
      hash[:address1] = location.formatted_line1
      hash[:address2] = location.formatted_line2
    end

    return hash

  end


end
