class CreateContactSubmissions < ActiveRecord::Migration
  def change
    create_table :contact_submissions do |t|
      t.string :name
      t.string :agency_name
      t.string :email
      t.text :message
      t.string :ip
      t.string :category

      t.timestamps
    end
  end
end
