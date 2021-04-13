class FriendsController < ApplicationController
  def create
    followee = User.find_by(id: params[:followee_id])
    return render json: { error: "Followee not found" }, status: 404 unless followee
    friend = Friend.find_or_create_by(
      follower_id: @user.id,
      followee_id: params[:followee_id]
    )
    friend.update(is_deleted: false)
    render json: { message: "Follow successfull" }, status: 200
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
