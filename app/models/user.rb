class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me


  def self.authenticate!(username, password)
    return nil if username.blank? || password.blank?

    if (user = User.find_by_email(username))
      return user if user.valid_password?(password)
    end

    nil
  end

end
