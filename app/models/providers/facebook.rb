module Providers::Facebook
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def find_facebook(auth, current_user = nil)
      return nil if auth.nil?
      facebook = Provider.named(:facebook).first
      connection = Connection.where(provider_id: facebook.id, user_key: auth['uid'].to_s).first
      name = auth['info']['name']
      image = auth['info']['image'].gsub(/(type=)(.*)/, '\1')
      if connection.nil?
        if current_user.nil?
          user = User.create!(
            name: name,
            email: auth['info']['email'],
            image: image,
            password: Devise.friendly_token[0,20],
          )
        else
          user = current_user
        end
        connection = Connection.create!(
          provider_id: facebook.id,
          user_id: user.id,
          user_key: auth['uid'].to_s,
          access_token: auth['credentials']['token'],
          name: name,
          email: auth['info']['email'],
          image: image,
          raw: auth.to_yaml,
        )
      else
        user = User.find connection[:user_id]
        user.name = name
        user.image = image
        user.save!
        connection.name = name
        connection.image = image
        connection.email = auth['info']['email']
        connection.access_token = auth['credentials']['token']
        connection.raw = auth.to_yaml
        connection.save!
      end
      user
    end
  end
end
