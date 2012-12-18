# == Schema Information
#
# Table name: payroll_batches
#
#  id           :integer          not null, primary key
#  agency_id    :integer
#  batch_date   :datetime
#  notes        :text
#  period_start :date
#  period_end   :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class PayrollBatch < ActiveRecord::Base
  belongs_to :agency

  has_many :payroll_line_items
  has_many :visits, :through => :payroll_line_items
end
