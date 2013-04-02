# == Schema Information
#
# Table name: work_breaks
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  visit_id         :integer
#  guid             :string(255)
#  in_time          :datetime
#  out_time         :datetime
#  auto_checked_out :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  duration_minutes :integer          default(0)
#

class WorkBreak < ActiveRecord::Base

  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::NumberHelper
  include VisitsHelper
  include ResourcesHelper

  before_save :process_pre_save
  after_save  :process_after_save

  belongs_to :user
  belongs_to :visit

  has_many :work_break_check_ins

  @recalculate_duration = false

  def process_pre_save
    self.guid = UUID.generate if self.guid.blank?
    if completed? or recalculate_duration?
      self.duration_minutes = rounded_for_billing calculate_duration_minutes(self.in_time, self.out_time)
    end
  end

  def process_after_save
    if self.out_time_changed?
      visit.update_break_minutes!
    end
  end

  def employee_label
    (user.nil?) ? 'N/A' : user.full_name_last_first
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
    !out_time.blank?
  end


  def total_hours
    duration_minutes.to_f / 60.0
  end


  def duration
    (out_time.blank?) ? nil : out_time - in_time
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

  def recalculate_duration= value
    @recalculate_duration = value
  end

  def recalculate_duration?
    @recalculate_duration
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
      :month => in_time.to_formatted_s(:month_abbrev),
      :day => in_time.to_formatted_s(:day_only)
    }


    if completed?
      hash[:timespan_fmt] = start_to_stop
      hash[:duration_fmt] = duration_string
    end

    hash
  end


end
