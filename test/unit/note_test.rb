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
#

require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
