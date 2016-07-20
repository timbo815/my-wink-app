class LightbulbsController < ApplicationController

  def index
    headers = {
      :content_type => "application/json",
      :Authorization => "Bearer #{current_user.auth_token}"
    }

    response = RestClient.get 'https://api.wink.com/users/me/light_bulbs', headers
    j_response = JSON.parse(response)
    @lightbulbs = j_response["data"]
    render :index
  end

  def show
    id = params[:id]
    headers = {
      :content_type => "application/json",
      :Authorization => "Bearer #{current_user.auth_token}"
    }
    response = RestClient.get 'https://api.wink.com/light_bulbs/' + id, headers
    j_response = JSON.parse(response)
    @lightbulb = j_response["data"]
    render :show
  end

end
