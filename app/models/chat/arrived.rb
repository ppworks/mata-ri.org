class Chat::Arrived < Chat
  after_initialize :set_default_values
  after_create :update_room

  private
  def set_default_values
    self.content = I18n.t('chat.arrived.content')
  end

  def update_room
    self.room.update_column(:last_arrived_at, self.created_at)
  end
end
