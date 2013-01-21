class Chat::Message < Chat
  before_create :set_origin_room_id

  private
  def set_origin_room_id
    self.origin_room_id = self.room_id
  end
end
