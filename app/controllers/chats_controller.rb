require_dependency 'chat/message'
class ChatsController < ApplicationController
  before_filter Filters::NestedResourcesFilter.new
  before_filter :authenticate_user!
  layout Proc.new { |controller| controller.request.xhr? ? nil : 'application' }

  def index
    @room = @parent
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
