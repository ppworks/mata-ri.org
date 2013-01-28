class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :set_current_user, only: [:edit, :update]

  def index
    @users = User.order('updated_at DESC').page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to request.referer
    else
      render :edit
    end
  end

  private
  def set_current_user
    @user = User.find(current_user.id)
  end
end
