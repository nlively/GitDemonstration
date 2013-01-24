class AddPhoneToCareRecipient < ActiveRecord::Migration
  def change
    add_column :care_recipients, :middle_name, :string
    add_column :care_recipients, :gender, :string
    add_column :care_recipients, :phone, :string
    add_column :care_recipients, :sms, :string
  end
end
