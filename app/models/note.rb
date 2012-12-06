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
  has_one :photo
  belongs_to :user
  belongs_to :care_recipient
end
