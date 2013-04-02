class WorkBreak < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :visit
  belongs_to :user

end
