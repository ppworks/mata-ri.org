class Chat::Left < Chat
  after_initialize :set_default_values
  after_create :update_room

  private
  def set_default_values
    self.content = I18n.t('chat.left.content')
  end

  def update_room
    self.room.update_column(:last_left_at, self.created_at)
  end
end
