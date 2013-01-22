class Chat::Left < Chat
  after_initialize :set_default_values
  after_create :send_other_rooms
  after_create :update_room

  private
  def set_default_values
    self.content = I18n.t('chat.left.content')
  end

  def update_room
    return unless self.origin_room_id == self.room_id
    self.room.update_column(:last_left_at, self.created_at)
  end
end
