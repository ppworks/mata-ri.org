class Chat::Move < Chat
  def target_room_id
    self.content.try(:to_i)
  end

  def target_room
    Room.find(self.target_room_id)
  end
end
