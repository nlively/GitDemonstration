class Note < ActiveRecord::Base
  has_one :photo
  belongs_to :user
  belongs_to :care_recipient
end
