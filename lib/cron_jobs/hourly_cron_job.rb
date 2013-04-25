class CronJobs::HourlyCronJob

  def self.run

    cron_controller = CronController.new

    Rails.logger.debug "Hourly cron tasks..."

    begin
      cron_controller.close_dead_visits
    rescue => ex
      Rails.logger.debug "Failed to generate invoices. " + ex.message
      Airbrake.notify ex
    end

  end

end