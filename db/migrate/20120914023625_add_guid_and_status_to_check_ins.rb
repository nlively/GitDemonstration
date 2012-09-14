class AddGuidAndStatusToCheckIns < ActiveRecord::Migration
  def change
    add_column :check_ins, :session_guid, :string, :limit => 32
    add_column :check_ins, :in_out, :boolean
  end
end
