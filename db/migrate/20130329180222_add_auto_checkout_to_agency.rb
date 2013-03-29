class AddAutoCheckoutToAgency < ActiveRecord::Migration
  def change
    add_column :agencies, :auto_check_out, :boolean, :not_null => true, :default => 1
  end
end
