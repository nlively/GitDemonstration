class Observation < ActiveRecord::Base
  attr_accessible :label, :weight

  has_many :visits_observations
  has_many :visits, :through => :visits_observations

end
