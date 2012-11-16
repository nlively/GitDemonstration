class AddCareRecipientToCheckIn < ActiveRecord::Migration
  def change
    add_column :check_ins, :care_recipient_id, :integer
    add_column :check_ins, :location_id, :integer
  end
end
