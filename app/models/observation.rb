class Observation < ActiveRecord::Base
  attr_accessible :label, :weight

  has_many :observations_diagnoses
  has_many :diagnoses, :through => :observations_diagnoses

  has_many :visits_observations
  has_many :visits, :through => :visits_observations

end
