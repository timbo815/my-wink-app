class ScenesController < ApplicationController
  def index
    headers = {
      :content_type => "application/json",
      :Authorization => "Bearer #{current_user.auth_token}"
    }
    response = RestClient.get 'https://api.wink.com/users/me/scenes', headers
    j_response = JSON.parse(response)
    @scenes = j_response["data"]
  end

  def show
    id = params[:id]

    headers = {
      :content_type => "application/json",
      :Authorization => "Bearer #{current_user.auth_token}"
    }
    response = RestClient.get 'https://api.wink.com/scenes/' + id, headers
    j_response = JSON.parse(response)
    @scene = j_response["data"]
  end

  def update
    id = params[:id]

    headers = {
      :content_type => "application/json",
      :Authorization => "Bearer #{current_user.auth_token}"
    }
    response = RestClient.post 'https://api.wink.com/scenes/' + id + '/activate', headers
    j_response = JSON.parse(response)
    @scene = j_response["data"]
    render :show
  end
end
