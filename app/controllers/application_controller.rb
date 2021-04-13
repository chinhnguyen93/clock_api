class ApplicationController < ActionController::API
  before_action :authenticate_user!

  private

  def authenticate_user!
    auth_id, user_name = if request.authorization
      authorization = JSON.parse(request.authorization)
      [authorization["auth_id"], authorization["name"]]
    else
      [params[:auth_id], params[:name]]
    end
    @user = User.find_by(id: auth_id)
    return render json: { error: "Unauthorized" }, status: :unauthorized unless @user && @user&.name == user_name
  end
end
