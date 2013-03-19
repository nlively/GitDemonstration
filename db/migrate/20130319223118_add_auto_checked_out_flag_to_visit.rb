class AddAutoCheckedOutFlagToVisit < ActiveRecord::Migration
  def change
    add_column :check_ins, :auto, :boolean, :not_null => true, :default => 0
    add_column :visits, :auto_checked_out, :boolean, :not_null => true, :default => 0
  end
end
