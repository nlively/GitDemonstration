class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.integer :user_id
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
