class PushersController < ApplicationController
  protect_from_forgery except: :authentication
  
  def authentication
    res = Pusher[params[:channel_name]].authenticate(
      params[:socket_id],
      user_id: current_user.try(:id) || read_only_member_id,
      user_info: {
        id: current_user.try(:id),
        name: current_user.try(:name),
        color: current_user.try(:color),
        type: current_user.try(:type),
        path: request.referer,
      },
    )
    render json: res
  end

  private
  def read_only_member_id
    Digest::SHA1.hexdigest(Time.current.to_f.to_s)
  end
end
