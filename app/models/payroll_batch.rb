# == Schema Information
#
# Table name: payroll_batches
#
#  id           :integer          not null, primary key
#  agency_id    :integer
#  batch_date   :datetime
#  notes        :text
#  period_start :date
#  period_end   :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  status       :string(255)      default("pending")
#  exported     :boolean          default(FALSE)
#

class PayrollBatch < ActiveRecord::Base
  include ApplicationHelper
  include InvoiceHelper
  belongs_to :agency

  has_many :payroll_line_items
  has_many :visits, :through => :payroll_line_items

  def batch_number
    id.to_s.rjust 4, '0'
  end

  def status_formatted
    unless status.nil?
      batch_statuses[status.to_sym] #unless status.nil?
    end
  end

  # Deletes a batch and its associated data
  def back_out!

    self.visits.each {|v| v.payroll_line_item_id = nil; v.save!}
    self.payroll_line_items.each {|d| d.delete}

    self.delete

  end

  def filename
    fn = sprintf '%s payroll export', batch_number
    sanitize_filename fn
  end

  def export! dirname=nil

    require 'rubygems'
    require 'zip/zip'

    path = filename + '.csv'

    files = [path]
    summary_csv = []
    summary_csv << ['Employee', 'Total Hours', 'Total Earned']

    self.payroll_line_items.each do |pli|
      fn = pli.filename + '.csv'
      summary_csv << [ pli.user.full_name_last_first, pli.total_hours, pli.total_formatted ]
      files << fn
      pli.export!(dirname + '/' + fn)
    end


    self.status = :pending
    self.exported = true
    self.save!


    CSV.open(dirname + '/' + path, 'w') do |csv|
      summary_csv.each do |line|
        csv << line
      end
    end # FasterCSV

    #zip_path = "#{dirname}/#{filename}.zip"

    t = Tempfile.new('export')
    Zip::ZipOutputStream.open(t.path) do |z|
      files.each do |path|
        z.put_next_entry(path)
        z.print IO.read(dirname + '/' + path)
      end
    end
    t.close

    t.path

  end

end
