class ClocksController < ApplicationController
  def index
    list_clocks = if params[:friend_id]
      friend = Friend.exist.find_by(
        follower_id: @user.id,
        followee_id: params[:friend_id]
      )
      return render json: { error: "This user is not your friend" }, status: 404 unless friend
      Clock
        .where(user_id: params[:friend_id])
        .where(created_at: [DateTime.now - 7.days..DateTime.now])
        .sort_by { |clock| clock.end_time - clock.start_time }
    else
      Clock.where(user_id: @user.id).order("created_at ASC")
    end
    render json: { list_clocks: list_clocks }, status: 200
  end
end
