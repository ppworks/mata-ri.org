class AddTargetRoomIdToChats < ActiveRecord::Migration
  def up
    add_column :chats, :target_room_id, :integer
    Chat::Move.all.each do|chat|
      chat.update_column(:target_room_id, chat.content.to_i)
      chat.update_column(:content, '')
    end
  end

  def down
    Chat::Move.all.each do|chat|
      chat.update_column(:content, chat.target_room_id.to_s)
    end
    remove_column :chats, :target_room_id, :integer
  end
end
