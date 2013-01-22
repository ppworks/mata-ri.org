class MovesController < ApplicationController
  before_filter Filters::NestedResourcesFilter.new
  before_filter :authenticate_user!

  def create
    @room = @parent
    @target_room = Room.find(params[:chat][:target_room_id])
    @chat = @room.chat_moves.create!(
      user_id: current_user.id,
      user_name: current_user.name,
      color: current_user.color,
      content: @target_room.id,
    )
    redirect_to room_chats_path(@target_room)
  end
end
