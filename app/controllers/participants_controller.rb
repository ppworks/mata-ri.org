class ParticipantsController < ApplicationController
  before_filter Filters::NestedResourcesFilter.new
  before_filter :authenticate_user!, only: [:destroy]

  def create
    name = params[:user_name]
    color = params[:color]
    @room = @parent
    @chat = @room.chat_arriveds.build(user_name: name, color: color) 
    begin
      User.transaction do
        @chat.save!
        if user_signed_in?
          current_user.update_attributes(name: name, color: color)
        else
          user = User::Guest.create(name: name, color: color)
          sign_in(user)
        end
      end
      redirect_to room_chats_path(@room)
    rescue => e
      logger.error e.to_yaml
      e.backtrace.each { |line| logger.error line }
      redirect_to room_path(@room)
    end
  end

  def destroy
    @room = @parent
    @chat = @room.chat_lefts.build(user_name: current_user.name, color: current_user.color) 
    @chat.save!
    redirect_to root_path
  end
end
