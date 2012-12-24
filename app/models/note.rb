# == Schema Information
#
# Table name: notes
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  care_recipient_id :integer
#  note              :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  visit_id          :integer
#

class Note < ActiveRecord::Base
  include ResourcesHelper

  has_one :photo
  belongs_to :user
  belongs_to :care_recipient



  def web_service_format url_base

    hash = {
      :id => id,
      :created_at => created_at,
      :created_at_fmt_date => created_at.to_formatted_s(:mdy),
      :created_at_fmt_time => created_at.to_formatted_s(:hour_with_minute_meridian),
      :note => note,
      :note_trimmed => note.truncate(150),
      :user_id => user.id,
      :user_full_name => user.full_name,
      :user_photo_url => full_url(url_base, user.profile_photo.url(:profile)),
      :care_recipient_id => care_recipient.id,
      :care_recipient_full_name => care_recipient.full_name,
      :care_recipient_photo_url => full_url(url_base, care_recipient.profile_photo.url(:profile)),
    }

    return hash

  end
end
