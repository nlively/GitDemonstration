# == Schema Information
#
# Table name: check_ins
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  latitude          :integer
#  longitude         :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  session_guid      :string(32)
#  in_out            :boolean
#  care_recipient_id :integer
#  location_id       :integer
#  agency_id         :integer
#

class CheckIn < ActiveRecord::Base
  belongs_to :care_recipient
  belongs_to :location
  belongs_to :user
  belongs_to :agency


  def in_out_str
    return in_out ? 'in' : 'out'
  end

  def label
    str = ""
    str <<  user.label unless user.nil?
    str <<  sprintf("%s at %s", in_out_str, created_at.to_formatted_s(:mdy_with_time))
    return str
  end


end
