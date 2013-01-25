class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.string :label, :not_null => true
      t.integer :weight, :not_null => true, :default => 0

      t.timestamps
    end
  end
end
