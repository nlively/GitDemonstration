class AddAutoExpiredToVisit < ActiveRecord::Migration
  def change
    add_column :visits, :auto_expired, :boolean, :not_null => true, :default => 0
  end
end
