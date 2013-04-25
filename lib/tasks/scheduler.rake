desc "This task is called by the Heroku scheduler add-on"

task :daily => :environment do
  puts "Running daily tasks..."
  CronJobs::DailyCronJob.run
  puts "done running daily tasks."
end

task :hourly => :environment do
  puts "Running hourly tasks..."
    CronJobs::HourlyCronJob.run
    puts "done running hourly tasks."
end
