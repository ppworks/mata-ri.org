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

    @colors = Chat.colors
    session["user_return_to"] = request.path
  end
end
