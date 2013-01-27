class PushersController < ApplicationController
  protect_from_forgery except: :authentication
  
  def authentication
    res = Pusher[params[:channel_name]].authenticate(
      params[:socket_id],
      user_id: current_user.try(:id) || Digest::SHA1.hexdigest(Time.current.to_f.to_s),
      user_info: {
        id: current_user.try(:id),
        name: current_user.try(:name),
        color: current_user.try(:color),
        path: request.referer,
      },
    )
    render json: res
  end
end
