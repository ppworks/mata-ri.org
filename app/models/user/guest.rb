class User::Guest < User
  after_initialize :set_default

  private
  def set_default
    return if self.persisted?
    self.email = "#{Devise.friendly_token[0,10]}#{Time.current.to_i}@guest.example.com"
    self.password = Devise.friendly_token[0,20]
  end
end
