# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  visit_id   :integer
#

class Note < ActiveRecord::Base
  include ResourcesHelper

  has_one :photo
  belongs_to :visit

  def web_service_format url_base

    hash = {
      :id => id,
      :created_at => created_at,
      :created_at_fmt_date => created_at.to_formatted_s(:mdy),
      :created_at_fmt_time => created_at.to_formatted_s(:hour_with_minute_meridian),
      :note => note,
      :note_trimmed => note.truncate(50),
      :visit_id => visit_id
    }

    return hash

  end
end
