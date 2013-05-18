class AddMappedClientIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :mapped_client_id, :integer, :not_null => false
  end
end
