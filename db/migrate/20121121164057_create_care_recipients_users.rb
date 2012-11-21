class CreateCareRecipientsUsers < ActiveRecord::Migration
  def change
    create_table :care_recipients_users do |t|
      t.integer :care_recipient_id
      t.integer :user_id
      t.timestamps
    end
  end
end
