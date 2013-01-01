# == Schema Information
#
# Table name: photos
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  care_recipient_id  :integer
#  note_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  visit_id           :integer
#  caption            :string(255)
#

class Photo < ActiveRecord::Base
  include ResourcesHelper

  belongs_to :note
  belongs_to :user
  belongs_to :care_recipient

  has_attached_file :photo, :styles => {
    :profile => "93x93>",
    :search_result => "45x45>",
    :shift_preview => "25x25>"
  }

  def web_service_format_minimal url_base
    hash = {
          :id => id,
          :created_at => created_at,
          :created_at_fmt_date => created_at.to_formatted_s(:mdy),
          :created_at_fmt_time => created_at.to_formatted_s(:hour_with_minute_meridian),
          :caption => caption,
          :thumbnail_url => full_url(url_base, photo.url(:profile)),
          :full_url =>full_url(url_base, photo.url),
        }
  end

  def web_service_format url_base

    hash = {
      :id => id,
      :created_at => created_at,
      :created_at_fmt_date => created_at.to_formatted_s(:mdy),
      :created_at_fmt_time => created_at.to_formatted_s(:hour_with_minute_meridian),
      :caption => caption,
      :file_name => photo_file_name,
      :thumbnail_url => full_url(url_base, photo.url(:profile)),
      :full_url =>full_url(url_base, photo.url),
      :visit_id => visit_id,
      :note_id => note_id,
      :user_id => user_id,
      :care_recipient_id => care_recipient_id
    }

    unless user.blank?
      hash[:user_full_name] = user.full_name
      hash[:user_photo_url] = full_url(url_base, user.profile_photo.url(:profile))
    end

    unless care_recipient.blank?
      hash[:care_recipient_full_name] = care_recipient.full_name
      hash[:care_recipient_photo_url] = full_url(url_base, care_recipient.profile_photo.url(:profile))
    end

    hash
  end

end
