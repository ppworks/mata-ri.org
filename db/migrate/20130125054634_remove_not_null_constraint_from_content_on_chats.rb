class RemoveNotNullConstraintFromContentOnChats < ActiveRecord::Migration
  def up
    change_column :chats, :content, :text, null: true
  end

  def down
    Chat.where(content: nil).update_all(content: '')
    change_column :chats, :content, :text, null: false
  end
end
