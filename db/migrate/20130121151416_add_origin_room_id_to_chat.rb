class AddOriginRoomIdToChat < ActiveRecord::Migration
  def change
    add_column :chats, :origin_room_id, :integer
  end
end
