class DevicesController < ApplicationController
  require 'rest_client'

  def index
    headers = {
      :content_type => "application/json",
      :Authorization => "Bearer #{current_user.auth_token}"
    }

    response = RestClient.get 'https://api.wink.com/users/me/wink_devices', headers
    j_response = JSON.parse(response)
    @devices = j_response["data"]
    render :index
  end

end
