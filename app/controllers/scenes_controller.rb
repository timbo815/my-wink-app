class ScenesController < ApplicationController

  before_action :require_user!

  def index
    path = '/users/me/scenes'
    response = RestClient.get host_url + path, auth_header
    j_response = JSON.parse(response)
    @scenes = j_response["data"]
  end

  def show
    id = params[:id]
    path = '/scenes/' + id
    response = RestClient.get host_url + path, auth_header
    j_response = JSON.parse(response)
    @scene = j_response["data"]
  end

  def update
    id = params[:id]
    path = '/scenes/' + id + '/activate'
    response = RestClient.post host_url + path, {}, auth_header
    j_response = JSON.parse(response)
    @scene = j_response["data"]
    render :show
  end
end
