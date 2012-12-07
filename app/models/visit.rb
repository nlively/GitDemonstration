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

  belongs_to :care_recipient
  belongs_to :user
  belongs_to :location
  belongs_to :agency
  belongs_to :approved_by_user, :class_name => 'User', :foreign_key => :approved_by_user_id

  has_many :check_ins

  def employee_label
    return (user.nil?) ? 'N/A' : user.full_name_last_first
  end

  def client_label
    return (care_recipient.nil?) ? 'N/A' : care_recipient.full_name_last_first
  end

  def in_time_formatted

  end

  def out_time_formatted

  end

  def duration
    return out_time - in_time
  end

  def duration_formatted

  end

  def location_label
    return (location.nil?) ? 'N/A' : location.label
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

  def self.pending
    Visit.where :out_time => nil
  end

  def web_service_format url_base, location=nil

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
      :location_id => location_id
    }

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
