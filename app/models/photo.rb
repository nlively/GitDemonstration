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
