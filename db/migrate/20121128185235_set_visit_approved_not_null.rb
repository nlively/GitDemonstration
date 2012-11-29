class SetVisitApprovedNotNull < ActiveRecord::Migration
  def up
    change_column_null :visits, :approved, :boolean, false
  end

  def down
  end
end
