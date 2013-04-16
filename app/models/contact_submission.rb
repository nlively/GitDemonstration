# == Schema Information
#
# Table name: contact_submissions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  message    :text
#  ip         :string(255)
#  category   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ContactSubmission < ActiveRecord::Base
end
