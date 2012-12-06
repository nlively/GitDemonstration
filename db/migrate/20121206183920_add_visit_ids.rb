class AddVisitIds < ActiveRecord::Migration
  def up
    add_column :notes, :visit_id, :integer
    add_column :photos, :visit_id, :integer
  end

  def down
  end
end
