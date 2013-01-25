class VisitsObservation < ActiveRecord::Base
  attr_accessible :observation_id, :visit_id

  belongs_to :observation
  belongs_to :visit
end
