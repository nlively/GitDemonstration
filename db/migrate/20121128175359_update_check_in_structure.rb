class UpdateCheckInStructure < ActiveRecord::Migration
  def up

    remove_column :check_ins, :care_recipient_id
    remove_column :check_ins, :location_id
    remove_column :check_ins, :agency_id
    remove_column :check_ins, :session_guid

    change_column :check_ins, :latitude, :decimal, :precision=>11, :scale=>8
    change_column :check_ins, :longitude, :decimal, :precision=>11, :scale=>8

    add_column :check_ins, :visit_id, :integer

  end

  def down
  end
end
