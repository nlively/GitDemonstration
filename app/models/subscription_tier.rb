# == Schema Information
#
# Table name: subscription_tiers
#
#  id          :integer          not null, primary key
#  label       :string(255)
#  monthly_fee :decimal(11, 2)   default(0.0)
#  max_users   :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#  visible     :boolean          default(TRUE)
#  active      :boolean          default(TRUE)
#

class SubscriptionTier < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  include ActionView::Helpers::TextHelper

  has_many :agencies


  def monthly_fee_formatted
    number_to_currency( monthly_fee, :unit => "$", :precision => 2 )
  end


  def is_higher_level_than? subscription
    subscription.blank? or (monthly_fee > subscription.monthly_fee)
  end

  def is_lower_level_than? subscription
    (not subscription.blank?) and (monthly_fee < subscription.monthly_fee)
  end

  def max_users_formatted
    pluralize(max_users, 'user', 'users')
  end


  def self.all_visible
    SubscriptionTier.where :visible => true, :active => true
  end

  def self.all_active
    SubscriptionTier.where :active => true
  end

end
