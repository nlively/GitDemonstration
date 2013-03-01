# == Schema Information
#
# Table name: agency_account_histories
#
#  id          :integer          not null, primary key
#  agency_id   :integer
#  label       :string(255)
#  units       :integer
#  action_type :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AgencyAccountHistory < ActiveRecord::Base
  attr_accessible :agency_id, :action_type, :label, :units

  belongs_to :agency

end
