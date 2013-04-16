class CreateAgencySignupRequests < ActiveRecord::Migration
  def change
    create_table :agency_signup_requests do |t|
      t.string :agency_name
      t.string :contact_name
      t.string :email
      t.string :website
      t.string :phone
      t.string :ip
      t.integer :requested_users
      t.integer :agency_id

      t.timestamps
    end
  end
end
