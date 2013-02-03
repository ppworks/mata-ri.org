class Chat < ActiveRecord::Base
  attr_accessible :color, :content, :origin_room_id, :room_id, :style, :target_room_id, :type, :user_id, :user_name
  validates_presence_of :user_name
  validates_inclusion_of :style, in: lambda {|chat| chat.class.style_keys}, if: lambda {|chat| chat.style.present?}

  belongs_to :room
  belongs_to :origin_room, class_name: 'Room'
  belongs_to :target_room, class_name: 'Room'
  belongs_to :user

  scope :short_log, lambda{
    order('id DESC')
    .limit(50)
  }

  scope :participants, lambda{
    where(type: ['Chat::Arrived', 'Chat::Left'])
    .where('room_id = origin_room_id')
  }

  scope :message, lambda {
    where(type: ['Chat::Message'])
  }

  after_create :send_to_pusher

  class << self
    def colors
      %w{
        #d07070
        #f89898
        #c08858
        #e8b080
        #a8a048
        #c8c070
        #78a058
        #a0c880
        #409890
        #68c0b8
        #6090b8
        #88b0e0
        #8970a9
        #b8a0d8
        #c078a8
        #e8a0d0
        #787878
        #a8a8a8
        #111111
      }
    end
    
    def styles
      I18n.t('chat.styles')
    end

    def style_keys
      self.styles.map{|s|s[1]}
    end
  end

  def origin?
    self.origin_room_id == self.room_id
  end

  def target?
    self.target_room_id == self.room_id
  end

  def user_name_linked
    return self.user_name unless self.user
    if self.try(:user).try('instance_of?', User::Reserved)
      ApplicationController.helpers.link_to(self.user_name,
                                            Rails.application.routes.url_helpers.user_path(self.user),
                                            style: "color: #{self.color}",
                                            target: '_blank')
    else
      self.user_name
    end
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
