class ApiController < ApplicationController
  ERROR_RESPONSE_DATA = {
    ActiveRecord::RecordNotFound => { message: "Record not exists", status: 404 },
  }

  respond_to :json

  rescue_from Exception, with: :handle_api_exception

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
      render_error("Access token incorrect!", 401) unless current_user
    end

    def render_error message, status = 500
      render json: { error: message }, status: status and return
    end

    def handle_api_exception exception
      current_data = ERROR_RESPONSE_DATA[exception.class] || {}
      render_error(current_data[:message] || exception.inspect, current_data[:status])
    end
end
