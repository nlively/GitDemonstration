class CreateAgencyAccountHistories < ActiveRecord::Migration
  def change
    create_table :agency_account_histories do |t|
      t.integer :agency_id, :not_null => true
      t.string :label
      t.integer :units
      t.string :action_type

      t.timestamps
    end
  end
end
