class AddClientCaregiverFields < ActiveRecord::Migration
  def up
    add_column :users, :auto_check_out, :boolean, :not_null => true, :default => 1
    add_column :care_recipients, :is_company, :boolean, :not_null => true, :default => 0
    add_column :care_recipients, :company_name, :string
  end

  def down
  end
end
