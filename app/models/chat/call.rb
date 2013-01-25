class Chat::Call < Chat
  after_create :send_other_rooms

  private
  def send_other_rooms
    return if self.origin_room_id
    self.update_column(:origin_room_id, self.room_id)

    Room.all.each do|room|
      next if room.id == self.room_id
      next if room.id == self.target_room_id
      create_for_other_room(room)
    end
  end

  def create_for_other_room(room)
    self.class.create!(
      user_id: self.user_id,
      user_name: self.user_name,
      color: self.color,
      room_id: room.id,
      origin_room_id: self.origin_room_id,
      target_room_id: self.target_room_id,
      content: self.content,
    ) 
  end
end
