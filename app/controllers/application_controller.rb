class ApplicationController < ActionController::API
  before_action :authenticate_user!

  private

  def authenticate_user!
    @user = User.find_by(id: params[:auth_id])
    return render json: { error: "Unauthorized" }, status: :unauthorized unless @user && @user&.name == params[:name]
  end
end
