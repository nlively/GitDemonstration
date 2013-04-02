module Boomr::WithInOutTime
  include ActionView::Helpers::NumberHelper

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

  def total_hours
    duration_minutes.to_f / 60.0
  end

end