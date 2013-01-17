class CreateBillingLineItems < ActiveRecord::Migration
  def change
    create_table :billing_line_items do |t|
      t.integer :billing_batch_id
      t.integer :care_recipient_id
      t.integer :pay_status
      t.decimal :hours
      t.decimal :bill_rate
      t.decimal :adjustments
      t.decimal :original_bill_rate

      t.timestamps
    end
  end
end
