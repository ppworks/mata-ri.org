class Room < ActiveRecord::Base
  attr_accessible :content, :last_arrived_at, :last_left_at, :max_count, :members_count, :name

  validates_presence_of :name
end
