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


  def visit
    visit_id = nil

    case stream_type.to_sym
      when :photo
        visit_id = Photo.find(reference_id).visit_id
      when :work_break
        visit_id = WorkBreak.find(reference_id).visit_id
      else
        visit_id = reference_id
    end

    unless visit_id.nil?
      Visit.find visit_id
    end
  end


  def self.create_from_visit! visit, check_in=true

    label_template = (check_in) ? '%s checked in with %s' : '%s checked out with %s'

    data = self.create!({
      :user => visit.user,
      :care_recipient => visit.care_recipient,
      :agency => visit.user.agency,
      :stream_type => (check_in) ? :check_in : :check_out,
      :label => sprintf(label_template, visit.user.full_name, visit.care_recipient.full_name),
      :reference_id => visit.id
    })
    data
  end

  def self.create_from_photo! photo
    data = self.create!({
      :user => photo.user,
      :care_recipient => photo.care_recipient,
      :agency => photo.user.agency,
      :stream_type => :photo,
      :label => sprintf('%s added a photo for %s', photo.user.full_name, photo.care_recipient.full_name),
      :reference_id => photo.id
    })
    data
  end

  def self.create_from_work_break! work_break, check_in=true

    label_template = (check_in) ? '%s took a lunch break' : '%s came back from lunch'

    data = self.create!({
      :user => work_break.user,
      :care_recipient => work_break.visit.care_recipient,
      :agency => work_break.user.agency,
      :stream_type => :work_break,
      :label => sprintf(label_template, work_break.user.full_name),
      :reference_id => work_break.id
    })
    data
  end

  def self.create_from_data! visit
    data = self.create!({
      :user => visit.user,
      :care_recipient => visit.care_recipient,
      :agency => visit.user.agency,
      :stream_type => :data,
      :label => sprintf('%s added data for %s', visit.user.full_name, visit.care_recipient.full_name),
      :reference_id => visit.id
    })
    data
  end


end
