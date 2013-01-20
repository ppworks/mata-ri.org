class ArrivesController < ApplicationController
  before_filter Filters::NestedResourcesFilter.new

  def create
    @room = @parent
    @chat = @room.chat_arriveds.build(user_name: params[:user_name], color: params[:color]) 
    if @chat.valid?
      @chat.save!
      redirect_to room_chats_path(@room)
    else
      redirect_to room_path(@room)
    end
  end

  def destroy
    @room = @parent
    @chat = @room.chat_lefts.build(user_name: params[:user_name], color: params[:color]) 
    if @chat.valid?
      @chat.save!
    else
      redirect_to room_path(@room)
    end
  end
end
