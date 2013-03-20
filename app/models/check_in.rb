# == Schema Information
#
# Table name: check_ins
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  latitude   :decimal(11, 8)
#  longitude  :decimal(11, 8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  in_out     :boolean
#  visit_id   :integer
#  auto       :boolean          default(FALSE)
#

class CheckIn < ActiveRecord::Base
  belongs_to :user
  belongs_to :visit

  def in_out_str
    return in_out ? 'in' : 'out'
  end

  def label
    str = ""
    str <<  user.label unless user.nil?
    str <<  sprintf(" %s at %s", in_out_str, created_at.to_formatted_s(:mdy_with_time)) unless created_at.nil?
    return str
  end


end
