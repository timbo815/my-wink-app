class DevicesController < ApplicationController

  before_action :require_user!

  def index
    path = '/users/me/wink_devices'
    response = RestClient.get host_url + path, auth_header
    j_response = JSON.parse(response)
    @devices = j_response["data"]
    render :index
  end

end
