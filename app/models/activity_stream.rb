# == Schema Information
#
# Table name: activity_streams
#
#  id                :integer          not null, primary key
#  agency_id         :integer
#  user_id           :integer
#  care_recipient_id :integer
#  stream_type       :string(255)
#  label             :string(255)
#  reference_id      :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class ActivityStream < ActiveRecord::Base
  belongs_to :user
  belongs_to :care_recipient
  belongs_to :agency



  def self.create_from_visit! visit, check_in=true

    label_template = (check_in) ? '%s checked in with %s' : '%s checked out with %s'

    data = self.create!({
                     :user => visit.user,
                     :care_recipient => visit.care_recipient,
                     :agency => visit.user.agency,
                     :stream_type => (check_in) ? :check_in : :check_out,
                     :label => sprintf(label_template, visit.user.full_name, visit.care_recipient.full_name)
                 })
    data
  end

  def self.create_from_photo! photo
    data = self.create!({
                     :user => photo.user,
                     :care_recipient => photo.care_recipient,
                     :agency => photo.user.agency,
                     :stream_type => :photo,
                     :label => sprintf('%s uploaded a photo', photo.user.full_name)
                 })
    data
  end

  def self.create_from_note! note
    data = self.create!({
                     :user => note.user,
                     :care_recipient => note.care_recipient,
                     :agency => note.user.agency,
                     :stream_type => :note,
                     :label => sprintf('%s added a note', note.user.full_name)
                 })
    data
  end


end
