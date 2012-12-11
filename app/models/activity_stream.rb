class ActivityStream < ActiveRecord::Base
  belongs_to :user
  belongs_to :care_recipient
  belongs_to :agency

  def icon
    'icon here'
  end

  def self.create_from_visit! visit, check_in=true

    label_template = (check_in) ? '%s checked in with %s' : '%s checked out with %s'

    self.create!({
      :user => visit.user,
      :care_recipient => visit.care_recipient,
      :agency => visit.user.agency,
      :stream_type => (check_in) ? :check_in : :check_out,
      :label => sprintf(label_template, visit.user.full_name, visit.care_recipient.full_name)
    })
  end

  def self.create_from_photo! photo
    self.create!({
      :user => photo.user,
      :care_recipient => photo.care_recipient,
      :agency => photo.user.agency,
      :stream_type => :photo,
      :label => sprintf('%s uploaded a photo', photo.user.full_name)
    })
  end

  def self.create_from_note! note
    self.create!({
      :user => note.user,
      :care_recipient => note.care_recipient,
      :agency => note.user.agency,
      :stream_type => :note,
      :label => sprintf('%s added a note', note.user.full_name)
    })
  end


end
