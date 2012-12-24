class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable,
         :omniauthable

  attr_accessible :email, :image, :name, :password, :password_confirmation, :remember_me,
    :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email
end
