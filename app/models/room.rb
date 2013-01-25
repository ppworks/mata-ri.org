class Room < ActiveRecord::Base
  attr_accessible :content, :last_arrived_at, :last_left_at, :max_count, :members_count, :name

  validates_presence_of :name

  has_many :chats
  has_many :chat_arriveds, class_name: 'Chat::Arrived'
  has_many :chat_lefts, class_name: 'Chat::Left'
  has_many :chat_messages, class_name: 'Chat::Message'
  has_many :chat_moves, class_name: 'Chat::Move'
  has_many :chat_calls, class_name: 'Chat::Call'

  def other_room_list
    Room.order('id ASC').all.to_a.select{|room| room.id != self.id}
  end
end
