class LightbulbsController < ApplicationController

  before_action :require_user!

  def index
    path = '/users/me/light_bulbs'
    response = RestClient.get host_url + path, auth_header
    j_response = JSON.parse(response)
    @lightbulbs = j_response["data"]
    render :index
  end

  def show
    id = params[:id]
    path = '/light_bulbs/' + id
    response = RestClient.get host_url + path, auth_header
    j_response = JSON.parse(response)
    @lightbulb = j_response["data"]
    render :show
  end

end
