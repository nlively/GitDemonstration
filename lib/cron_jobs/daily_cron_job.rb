class CronJobs::DailyCronJob

  def self.run

    cron_controller = CronController.new

    Rails.logger.debug "Daily cron tasks..."

    begin
      cron_controller.generate_invoices
    rescue => ex
      Rails.logger.debug "Failed to generate invoices. " + ex.message
      Airbrake.notify ex
    end

    begin
      cron_controller.process_invoice_payments
    rescue => ex
      Rails.logger.debug "Failed to process invoice payments. " + ex.message
      Airbrake.notify ex
    end


  end

end