class AddApprovedByUserIdToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :approved_by_user_id, :integer
  end
end
