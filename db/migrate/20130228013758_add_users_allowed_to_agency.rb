class AddUsersAllowedToAgency < ActiveRecord::Migration
  def change
    add_column :agencies, :allowed_users, :integer, :not_null => true, :default => 0
  end
end
