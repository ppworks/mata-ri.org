class RoomsController < ApplicationController
  def index
    @rooms = Room.order('id ASC').all.to_a
    return if Rails.env.test?
    pusher_info = Pusher.get('/channels', {filter_by_prefix: 'presence-chats_', info: 'user_count'})
    @rooms.each do |room|
      room_info = pusher_info[:channels]["presence-chats_#{room.id}"]
      if room_info
        room.update_column(:members_count, room_info['user_count'])
      else
        room.update_column(:members_count, 0)
      end
    end
  end

  def show
    @room = Room.find(params[:id])
    @chats = @room.chats.short_log.all.to_a

    # [TODO] move to setting file
    @colors = %w{
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
end
