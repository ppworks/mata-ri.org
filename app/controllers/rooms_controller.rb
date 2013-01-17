class RoomsController < ApplicationController
  def index
    @rooms = Room.order('id ASC').all.to_a
  end

  def show
    @room = Room.find(params[:id])
  end
end
