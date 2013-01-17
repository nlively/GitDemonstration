# == Schema Information
#
# Table name: billing_line_items
#
#  id                 :integer          not null, primary key
#  billing_batch_id   :integer
#  care_recipient_id  :integer
#  pay_status         :integer
#  hours              :decimal(11, 2)   default(0.0)
#  bill_rate          :decimal(11, 2)   default(0.0)
#  adjustments        :decimal(11, 2)   default(0.0)
#  original_bill_rate :decimal(11, 2)   default(0.0)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class BillingLineItem < ActiveRecord::Base
  attr_accessible :adjustments, :bill_rate, :billing_batch_id, :care_recipient_id, :hours, :original_bill_rate, :pay_status

  include ActionView::Helpers::NumberHelper

    belongs_to :billing_batch
    belongs_to :user
    has_many :visits


    before_save :fill_defaults

    def fill_defaults
      self.original_bill_rate = bill_rate if original_bill_rate.blank?
    end

    def bill_rate_formatted
      number_to_currency( bill_rate, :unit => "$", :precision => 2 )
    end

    def total
      (hours * bill_rate) + adjustments
    end

    def total_formatted
      number_to_currency( total, :unit => "$", :precision => 2 )
    end

    def adjustments_formatted
      number_to_currency( adjustments, :unit => "$", :precision => 2 )
    end

end
