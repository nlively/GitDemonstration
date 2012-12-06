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
#

class Photo < ActiveRecord::Base
  belongs_to :note
  belongs_to :user
  belongs_to :care_recipient

  has_attached_file :photo, :styles => {
      :profile => "93x93>",
      :search_result => "45x45>",
      :shift_preview => "25x25>"
    }

end
