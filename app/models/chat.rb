class Chat < ActiveRecord::Base
  attr_accessible :color, :content, :room_id, :type, :user_id, :user_name
  validates_presence_of :user_name, :content

  scope :short_log, lambda{
    order('id DESC')
    .limit(50)
  }
end
