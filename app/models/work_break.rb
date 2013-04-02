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

  include Boomr::WithInOutTime
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
