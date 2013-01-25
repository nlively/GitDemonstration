class Observation < ActiveRecord::Base
  attr_accessible :label, :weight

  has_many :observations_diagnoses
  has_many :diagnoses, :through => :observations_diagnoses
end
