# == Schema Information
#
# Table name: work_break_check_ins
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  latitude      :decimal(11, 8)
#  longitude     :decimal(11, 8)
#  in_out        :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  work_break_id :integer
#  auto          :boolean          default(FALSE)
#

class WorkBreakCheckIn < ActiveRecord::Base

  belongs_to :work_break
  belongs_to :user


  def web_service_format url_base
    {
      :id => id,
      :latitude => latitude,
      :longitude => longitude
    }
  end

end
