## This controller is called from the cron_jobs/every_minute.rb.  Yes, we could have called it directly, but
## this allows a script to control what the cron is called, not just a functional interface. 
## so rails runner <path to>/cron_jobs/every_minute.rb
## when called will scan the appointments and send mails out for the defunct ones. 
## provided mails are being sent. 

class CronController < ApplicationController

  # Initiate payouts to providers
  def process_payments_due
    Agency.with_payment_due.each do |agency|
      begin
        agency.process_payment!
      rescue => ex
        Rails.logger.debug "Exception in CronController.process_payments_due: " + ex.message
        Rails.logger.debug sprintf("Agency ID was %d", agency.id)
        Airbrake.notify ex
      end
    end
  end

end
