# == Schema Information
#
# Table name: visits_patient_statuses
#
#  id                :integer          not null, primary key
#  visit_id          :integer
#  patient_status_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class VisitsPatientStatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
