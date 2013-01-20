class Chat < ActiveRecord::Base
  attr_accessible :color, :content, :room_id, :type, :user_id, :user_name
  validates_presence_of :user_name, :content

  belongs_to :room

  scope :short_log, lambda{
    order('id DESC')
    .limit(50)
  }

  scope :participants, lambda{
    where(type: ['Chat::Arrived', 'Chat::Left'])
  }

  after_create :send_to_pusher

  private

  def send_to_pusher
    Pusher["presence-chats_#{self.room_id}"].trigger_async('chat', id: self.id, user_id: self.user_id.to_s) unless Rails.env.test?
  end
end
