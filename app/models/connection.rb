class Connection < ActiveRecord::Base
  attr_accessible :access_token, :email, :image, :name, :provider_id, :raw, :refresh_token, :secret, :user_id, :user_key

  belongs_to :provider
  belongs_to :user
end
