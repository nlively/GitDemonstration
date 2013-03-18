class AddOriginalEmailToUser < ActiveRecord::Migration
  def change
    add_column :users, :original_email, :string


    User.all.each do |user|
      user.original_email = user.email
      user.save!
    end

  end
end
