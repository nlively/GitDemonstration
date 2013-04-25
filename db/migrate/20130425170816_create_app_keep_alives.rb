class CreateAppKeepAlives < ActiveRecord::Migration
  def change
    create_table :app_keep_alives do |t|
      t.string :operating_system
      t.integer :visit_id
      t.string :app_version
      t.integer :user_id

      t.timestamps
    end
  end
end
