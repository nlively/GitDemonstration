## This controller is called from the cron_jobs/every_minute.rb.  Yes, we could have called it directly, but
## this allows a script to control what the cron is called, not just a functional interface. 
## so rails runner <path to>/cron_jobs/every_minute.rb
## when called will scan the appointments and send mails out for the defunct ones. 
## provided mails are being sent. 

class CronController < ApplicationController

  def generate_invoices
    Agency.needing_invoice_generation.each do |agency|
      begin
        agency.generate_invoice!
      rescue => ex
        Rails.logger.debug "Exception in CronController.generate_invoices: " + ex.message
        Rails.logger.debug sprintf("Agency ID was %d", agency.id)
        Airbrake.notify ex
      end
    end
  end

  def process_invoices
    AgencyInvoice.ready_for_payment.each do |invoice|
      begin
        invoice.process_payment!
      rescue => ex
        Rails.logger.debug "Exception in CronController.process_invoices: " + ex.message
        Rails.logger.debug sprintf("Invoice ID was %d", invoice.id)
        Airbrake.notify ex

        invoice.auto_payment_attempts += 1
        invoice.save!
      end
    end
  end

end
