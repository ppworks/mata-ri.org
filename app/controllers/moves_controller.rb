class MovesController < ApplicationController
  before_filter :authenticate_user!
  def create
    @room = Room.find(params[:target_room_id])
    redirect_to room_chats_path(@room)
  end
end
