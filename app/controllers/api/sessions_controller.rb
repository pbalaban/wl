class Api::SessionsController < ApiController
  respond_to(:json)

  skip_before_action :verify_access_token

  def create
    @user = User.find_by(user_params.slice(:email))

    #TODO: make it with devise method, handle inactive account, etc.
    if @user.try(:valid_password?, user_params[:password])
      respond_with(@user, location: nil)
    else
      render json: { message: I18n.t(:"devise.failure.invalid", authentication_keys: :email) }, status: 422
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
