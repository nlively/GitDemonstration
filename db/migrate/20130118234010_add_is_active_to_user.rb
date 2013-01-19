class AddIsActiveToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_active, :boolean, :not_null => true, :default => 1
  end
end
