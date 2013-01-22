class Chat::Move < Chat
  after_create :send_other_rooms
  def target_room_id
    self.content.try(:to_i)
  end

  def target_room
    Room.find(self.target_room_id)
  end

  def target?
    self.target_room_id == self.room_id
  end

  private

  def send_other_rooms
    return if self.origin_room_id
    self.update_column(:origin_room_id, self.room_id)

    Room.all.each do|room|
      next if room.id == self.room_id
      next if room.members_count == 0 && room.id != self.target_room_id
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
      content: self.content,
    ) 
  end
end
