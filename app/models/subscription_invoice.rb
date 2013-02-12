class SubscriptionInvoice < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :agency
  has_many :subscription_invoice_line_items

end
