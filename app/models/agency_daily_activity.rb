# == Schema Information
#
# Table name: agency_daily_activities
#
#  id                                :integer          not null, primary key
#  agency_id                         :integer
#  original_id                       :integer
#  label                             :string(255)
#  weight                            :integer
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#  deleted                           :boolean          default(FALSE)
#  agency_daily_activity_category_id :integer
#

class AgencyDailyActivity < ActiveRecord::Base
  attr_accessible :agency_id, :original_id, :label, :weight

  belongs_to :agency
  belongs_to :agency_daily_activity_category

end
