class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :middle_name, :string
    add_column :users, :phone, :string
    add_column :users, :sms, :string
  end
end
