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
#  status       :string(255)      default("pending")
#

class PayrollBatch < ActiveRecord::Base
  include ApplicationHelper
  belongs_to :agency

  has_many :payroll_line_items
  has_many :visits, :through => :payroll_line_items

  def batch_number
    id.to_s.rjust 4, '0'
  end

  def status_formatted
      batch_statuses[status.to_sym] #unless status.nil?
  end

  # Deletes a batch and its associated data
  def back_out!

    self.visits.each {|v| v.payroll_line_item_id = nil; v.save!}
    self.payroll_line_items.each {|d| d.delete}

    self.delete

  end

end
