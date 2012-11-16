class AddProfilePhotoToUsersAndCareRecipients < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.has_attached_file :profile_photo
    end
    change_table :care_recipients do |t|
      t.has_attached_file :profile_photo
    end
    change_table :locations do |t|
      t.has_attached_file :outside_photo
    end
  end
end
