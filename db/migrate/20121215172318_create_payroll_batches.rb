class CreatePayrollBatches < ActiveRecord::Migration
  def change
    create_table :payroll_batches do |t|
      t.integer :agency_id
      t.datetime :batch_date
      t.text :notes
      t.date :period_start
      t.date :period_end

      t.timestamps
    end
  end
end
