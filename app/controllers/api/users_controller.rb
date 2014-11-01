class Api::UsersController < ApiController
  skip_before_action :verify_access_token

  def create
    @user = User.new(user_params)
    @user.skip_confirmation!
    @user.save

    respond_with(@user, location: nil)
  end

  private

  def user_params
    params.require(:user).permit(*%i(email password first_name last_name))
  end
end
