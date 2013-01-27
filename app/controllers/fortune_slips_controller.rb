class FortuneSlipsController < ApplicationController
  before_filter Filters::NestedResourcesFilter.new
  before_filter :authenticate_user!

  def create
    @room = @parent
    begin
      @chat = @room.chat_fortune_slips.create!(
        user_id: current_user.id,
        user_name: current_user.name,
        color: current_user.color,
      )
      Rails.cache.write("chat:#{@chat.id}", @chat)
    end
    respond_to do |format|
      format.html do
        redirect_to room_chats_path(@room)
      end
      format.js do
        render 'chats/create'
      end
    end
  end
end
