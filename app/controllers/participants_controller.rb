class ParticipantsController < ApplicationController
  before_filter Filters::NestedResourcesFilter.new
  before_filter :authenticate_user!, only: [:destroy]

  def index
    @chats = Chat.participants.short_log
  end

  def create
    name = params[:user_name]
    color = params[:color]
    @room = @parent
    begin
      User.transaction do
        if user_signed_in?
          @user = User.find(current_user.id)
          @user.update_attributes!(name: name, color: color)
        else
          @user = User::Guest.new(name: name, color: color)
          @user.save!
          sign_in(@user)
        end
        @chat = @room.chat_arriveds.create!(
          user_id: current_user.id,
          user_name: name,
          color: color
        ) 
      end
      redirect_to room_chats_path(@room)
    rescue => e
      logger.error e.to_yaml
      e.backtrace.each { |line| logger.error line }
      redirect_to room_path(@room), flash: { error: @user.errors.messages }
    end
  end

  def destroy
    @room = @parent
    @chat = @room.chat_lefts.build(
      user_id: current_user.id,
      user_name: current_user.name,
      color: current_user.color) 
    @chat.save!
    redirect_to root_path
  end
end
