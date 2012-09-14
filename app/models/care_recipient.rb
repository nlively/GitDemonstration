class CareRecipient < ActiveRecord::Base
  has_many :photos
  has_many :notes
  has_many :check_ins
end
