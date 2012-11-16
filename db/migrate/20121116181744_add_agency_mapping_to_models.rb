class AddAgencyMappingToModels < ActiveRecord::Migration
  def change
    add_column :care_recipients, :agency_id, :integer
    add_column :check_ins, :agency_id, :integer
    add_column :locations, :agency_id, :integer
    add_column :users, :agency_id, :integer
  end
end
