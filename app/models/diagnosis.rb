class Diagnosis < ActiveRecord::Base
  attr_accessible :label

  has_many :observations_diagnoses
  has_many :observations, :through => :observations_diagnoses
end
