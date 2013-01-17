# == Schema Information
#
# Table name: billing_batches
#
#  id           :integer          not null, primary key
#  agency_id    :integer
#  batch_date   :datetime
#  notes        :text
#  period_start :date
#  period_end   :date
#  status       :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class BillingBatch < ActiveRecord::Base
  attr_accessible :agency_id, :batch_date, :notes, :period_end, :period_start, :status

  include ApplicationHelper
  belongs_to :agency

  has_many :billing_line_items
  has_many :visits, :through => :billing_line_items

  def batch_number
    id.to_s.rjust 4, '0'
  end

  def status_formatted
    batch_statuses[status.to_sym] #unless status.nil?
  end

  # Deletes a batch and its associated data
  def back_out!

    self.visits.each {|v| v.payroll_line_item_id = nil; v.save!}
    self.billing_line_items.each {|d| d.delete}

    self.delete

  end

end
