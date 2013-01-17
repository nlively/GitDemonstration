# Braintree Payments module, used by the User model to attach Braintree data to a user record
module Boomr::BraintreeCustomer

  # Define fields that braintree will attach to a customer record when Agency.with_braintree_data! is called
  BRAINTREE_FIELDS = [:phone, :website, :company, :fax, :addresses, :credit_cards, :custom_fields]

  # Retrieve customer data from the Braintree web service (based on the braintree_customer_id field)
  # and map it to the User object.
  def self.attach_braintree_data(agency)
    braintree_data = Braintree::Customer.find(agency.braintree_customer_id)

    BRAINTREE_FIELDS.each do |field|
      user.class.send(:define_method, field) { braintree_data.send(field) }
    end
  end

end