module ApplicationHelper



  def invoice_statuses(include_blank=false)
    hash = {}
    hash[''] = 'Select one...' if include_blank

    hash[:pending] = 'Pending'
    hash[:processed] = 'Processed'
    hash[:voided] = 'Voided'

    hash
  end

  def batch_statuses(include_blank=false)
    hash = {}
    hash[''] = 'Select one...' if include_blank

    hash[:pending] = 'Pending'
    hash[:complete] = 'Complete'
    hash[:back_out] = 'Back out'

    hash
  end

  def temp_dir options = {:remove => true}
    @temp_dir ||= begin
      require 'tmpdir'
      require 'fileutils'
      called_from = File.basename caller.first.split(':').first, ".rb"
      path = File.join(Dir::tmpdir, "#{called_from}_#{Time.now.to_i}_#{rand(1000)}")
      Dir.mkdir(path)
      at_exit {FileUtils.rm_rf(path) if File.exists?(path)} if options[:remove]

      path
    end
  end

end
