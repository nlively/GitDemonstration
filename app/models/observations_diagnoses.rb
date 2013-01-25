class ObservationsDiagnoses < ActiveRecord::Base
  attr_accessible :diagnosis_id, :observation_id

  belongs_to :observation
  belongs_to :diagnosis
end
