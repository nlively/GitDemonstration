class SubscriptionInvoiceLineItem < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :subscription_invoice

end
