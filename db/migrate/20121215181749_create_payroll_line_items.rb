class CreatePayrollLineItems < ActiveRecord::Migration
  def change
    create_table :payroll_line_items do |t|
      t.integer :payroll_batch_id
      t.integer :care_recipient_id
      t.integer :user_id
      t.decimal :bill_rate
      t.decimal :pay_rate

      t.timestamps
    end


    add_column :visits, :payroll_line_item_id, :integer

  end
end
