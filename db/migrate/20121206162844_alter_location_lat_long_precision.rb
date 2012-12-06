class AlterLocationLatLongPrecision < ActiveRecord::Migration
  def up

    change_column :locations, :latitude, :decimal, :precision=>11, :scale=>8
    change_column :locations, :longitude, :decimal, :precision=>11, :scale=>8
  end

  def down
  end
end
