# coding: utf-8
class User < ActiveRecord::Base
  include Providers::Facebook
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  attr_accessible :color, :content, :email, :image, :name, :password, :password_confirmation, :remember_me
  
  validate :name_is_valid
  validates_presence_of :name

  has_many :connections, dependent: :delete_all
  has_many :providers, through: :connections


  def nick_name
    name.sub(/@|＠.*/, '')
  end

  def content_head
    self.content.split("\n")[0]
  end

  def content_body
    contents = self.content.split("\n")
    contents[1..contents.size].join("\n")
  end

  private
  def name_is_valid
    user = User::Reserved.where(name: self.nick_name).first
    if user.present? && user.id != self.id
      errors.add(:name, I18n.t('activerecord.errors.models.user.attributes.name.reserved'))
    end
  end
end
