class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :verify_access_token

  private
    def verify_access_token

    end
end
