class FriendsController < ApplicationController
  def create
    followee = User.find_by(id: params[:followee_id])
    return render json: { error: "Followee not found" }, status: 404 unless followee
    friend = Friend.new(
      follower_id: @user.id,
      followee_id: params[:followee_id]
    )
    render json: { message: "Follow successfull" }, status: 200 if friend.save
  end

  def destroy
    friend = Friend.exist.find_by(
      follower_id: @user.id,
      followee_id: params[:id]
    )
    return render json: { error: "Followee not found" }, status: 404 unless friend
    friend.update(is_deleted: true)
    render json: { message: "Unfollow successfull" }, status: 200
  end
end
