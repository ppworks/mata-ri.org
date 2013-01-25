class Chat::Message < Chat
  validates_presence_of :content
  before_create :set_origin_room_id

  private
  def set_origin_room_id
    self.origin_room_id = self.room_id
  end
end
