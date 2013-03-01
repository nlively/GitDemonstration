class AgencyAccountHistory < ActiveRecord::Base
  attr_accessible :agency_id, :action_type, :label, :units

  belongs_to :agency

end
