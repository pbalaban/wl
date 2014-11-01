class Api::UsersController < ApiController
  respond_to(:json)

  skip_before_action :verify_access_token

  def create
    @user = User.new(user_params)

    if @user.save
      respond_with(@user, location: nil)
    else
      respond_with(@user, status: 422)
    end
  end

  private
    def user_params
      params.require(:user).permit(*%i[email password first_name last_name])
    end
end
