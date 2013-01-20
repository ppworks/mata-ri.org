class Chat::Left < Chat
  after_initialize :set_default_values

  private
  def set_default_values
    self.content = I18n.t('chat.left.content')
  end
end
