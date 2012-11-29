# == Schema Information
#
# Table name: visits
#
#  id                :integer          not null, primary key
#  in_time           :datetime
#  out_time          :datetime
#  approved          :boolean
#  user_id           :integer
#  care_recipient_id :integer
#  location_id       :integer
#  agency_id         :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Visit < ActiveRecord::Base

  belongs_to :care_recipient
  belongs_to :user
  belongs_to :location
  belongs_to :agency

  has_many :check_ins

  def employee_label
    return (user.nil?) ? 'N/A' : user.full_name_last_first
  end

  def client_label
    return (care_recipient.nil?) ? 'N/A' : care_recipient.full_name_last_first
  end

  def in_time_formatted

  end

  def out_time_formatted

  end

  def duration
    return out_time - in_time
  end

  def duration_formatted

  end

  def location_label
    return (location.nil?) ? 'N/A' : location.label
  end

  def self.completed
    Visit.where("out_time IS NOT NULL")
  end

  def self.approved
    Visit.where :approved => true
  end

  def self.unapproved
    Visit.where :approved => false
  end

  def self.pending
    Visit.where :out_time => nil
  end



end
