class User::Reserved < User
  after_initialize :set_default

  private
  def set_default
    return if self.persisted?
    self.color = Chat.colors.last
  end
end
