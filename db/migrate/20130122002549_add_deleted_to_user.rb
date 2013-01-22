class AddDeletedToUser < ActiveRecord::Migration
  def change
    add_column :users, :deleted, :boolean, :not_null => true, :default => 0
  end
end
