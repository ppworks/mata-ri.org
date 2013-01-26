class Chat < ActiveRecord::Base
  attr_accessible :color, :content, :origin_room_id, :room_id, :style, :target_room_id, :type, :user_id, :user_name
  validates_presence_of :user_name

  belongs_to :room
  belongs_to :origin_room, class_name: 'Room'
  belongs_to :target_room, class_name: 'Room'

  scope :short_log, lambda{
    order('id DESC')
    .limit(50)
  }

  scope :participants, lambda{
    where(type: ['Chat::Arrived', 'Chat::Left'])
    .where('room_id = origin_room_id')
  }

  after_create :send_to_pusher

  class << self
    def styles
      I18n.t('chat.styles')
    end
  end

  def origin?
    self.origin_room_id == self.room_id
  end

  def target?
    self.target_room_id == self.room_id
  end

  private

  def send_to_pusher
    Pusher["presence-chats_#{self.room_id}"].trigger_async('chat', id: self.id, user_id: self.user_id.to_s) unless Rails.env.test?
  end

  def send_other_rooms
    return if self.origin_room_id
    self.update_column(:origin_room_id, self.room_id)

    Room.all.each do|room|
      next if room.id == self.room_id
      next if room.members_count == 0
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
    ) 
  end
end
