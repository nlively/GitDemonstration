class CareRecipientsUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :care_recipient
end
