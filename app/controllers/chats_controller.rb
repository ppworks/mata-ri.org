require_dependency 'chat/message'
class ChatsController < ApplicationController
  before_filter Filters::NestedResourcesFilter.new
  before_filter :authenticate_user!, except: [:show]
  layout Proc.new { |controller| controller.request.xhr? ? nil : 'application' }

  def index
    @room = @parent
    @chats = @room.chats.short_log.all.to_a
    @colors = Chat.colors
  end

  def show
    @room = @parent
    @chat = Rails.cache.fetch("chat:#{params[:id]}") do
      @room.chats.find(params[:id])
    end
  end

  def create
    @room = @parent
    begin
      @chat = @room.chat_messages.create!(
        user_id: current_user.id,
        user_name: current_user.name,
        color: current_user.color,
        content: params[:content],
        style: params[:style],
      )
      Rails.cache.write("chat:#{@chat.id}", @chat)
    end
    respond_to do |format|
      format.html do
        redirect_to room_chats_path(@room)
      end
      format.js do
        render :create
      end
    end
  end
end
