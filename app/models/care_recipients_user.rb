# == Schema Information
#
# Table name: care_recipients_users
#
#  id                :integer          not null, primary key
#  care_recipient_id :integer
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class CareRecipientsUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :care_recipient
end
