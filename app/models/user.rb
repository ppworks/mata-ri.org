class User < ActiveRecord::Base
  include Providers::Facebook
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  attr_accessible :color, :email, :image, :name, :password, :password_confirmation, :remember_me

  has_many :connections
  has_many :providers, through: :connections
end
