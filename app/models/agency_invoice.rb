# == Schema Information
#
# Table name: agency_invoices
#
#  id                    :integer          not null, primary key
#  agency_id             :integer
#  total                 :decimal(11, 2)   default(0.0)
#  invoice_date          :date
#  due_date              :date
#  auto_billing_date     :date
#  notes                 :text
#  status                :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  auto_payment_attempts :integer          default(0)
#  auto_charge           :boolean          default(FALSE)
#

class AgencyInvoice < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  belongs_to :agency
  has_many :agency_invoice_rows
  has_many :agency_invoice_payments

  def self.ready_for_payment
    AgencyInvoice.where('status = ? AND auto_charge = ? AND auto_billing_date <= ? AND auto_payment_attempts < ?', 0, true, Date.today, 3)
  end

  def invoice_number
    self.id
  end

  def invoice_number_formatted
    invoice_number.to_s.rjust 4, '0'
  end

  def invoice_date_formatted
    invoice_date.to_formatted_s :mdy
  end

  def due_date_formatted
    due_date.to_formatted_s :mdy
  end

  def auto_billing_date_formatted
    due_date.to_formatted_s :mdy
  end

  def status_formatted
    case status
      when 0
        'Unpaid'
      when 1
        'Paid'
      else
        'N/A'
    end
  end

  def paid?
    status == 1
  end

  def auto_charge_string
    if auto_charge?
      sprintf 'Will be automatically billed to card on file on %s', auto_billing_date.to_formatted_s(:mdy)
    end
  end

  def process_payment!

    amount = self.total
    self.agency.with_braintree_data!
    cc = self.agency.default_credit_card

    if amount > 0 and not cc.blank? and self.status == 0

      result = Braintree::Transaction.sale(
        :amount => number_with_precision(amount, :precision => 2),
        :customer_id => self.agency.braintree_customer_id,
        :payment_method_token => cc.token
      )

      if result.success?

        payment = AgencyInvoicePayment.create :agency_invoice => self, :payment_method => 'credit_card', :payment_token => cc.token, :amount => amount, :date => DateTime.current, :status => 1, :confirmation_token => result.transaction.id
        self.status = 1
        self.save!

        MailerAgency.bill_paid(payment).deliver

        return true

      else

        ex = Exception.new sprintf("Error processing payment with Braintree. Errors: %s", result.message)
        Airbrake.notify ex

        return result
      end

    end


  end


end
