class ApiController < ApplicationController
  respond_to(:json)

  skip_before_action :verify_authenticity_token
  before_action :authenticate_user_from_token!
  before_action :verify_access_token

  private
    def authenticate_user_from_token!
      token = params[:access_token].presence
      user = token && User.find_by(access_token: token)

      sign_in user, store: false if user
    end

    def verify_access_token
      render_error("Access token incorrect!") unless current_user
    end

    def render_error message, status = 401
      render json: { error: message }, status: status and return
    end
end
