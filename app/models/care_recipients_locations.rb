# == Schema Information
#
# Table name: care_recipients_locations
#
#  id                :integer          not null, primary key
#  care_recipient_id :integer
#  location_id       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class CareRecipientsLocations < ActiveRecord::Base
  belongs_to :location
  belongs_to :care_recipient
end
