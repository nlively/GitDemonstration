# == Schema Information
#
# Table name: agency_invoices
#
#  id                :integer          not null, primary key
#  agency_id         :integer
#  total             :decimal(11, 2)   default(0.0)
#  invoice_date      :date
#  due_date          :date
#  auto_billing_date :date
#  notes             :text
#  status            :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class AgencyInvoice < ActiveRecord::Base
  belongs_to :agency
  has_many :agency_invoice_rows
  has_many :agency_invoice_payments



  def process_payment!

    amount = self.total
    cc = self.agency.default_credit_card

    if amount > 0 and not cc.blank?

      result = Braintree::Transaction.sale(
        :amount => amount,
        :customer_id => self.agency.braintree_customer_id,
        :payment_method_token => cc.token
      )

      if result.success?

        AgencyInvoicePayment.create :agency_invoice => self, :payment_method => 'credit_card', :amount => amount, :date => DateTime.current, :status => 1, :token => result.token
        self.status = 1
        self.save!

      else

        ex = Exception.new sprintf("Error processing payment with Braintree.")
        Airbrake.notify ex

        return
      end

    end


  end

end
