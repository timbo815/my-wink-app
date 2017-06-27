class UsersController < ApplicationController

  def create
    email = params[:user][:email]
    password = params[:user][:password]

    values = <<-VALUES
    {
      "client_id": "basic_wink_client",
      "client_secret": #{ENV["CLIENT_SECRET"]},
      "username": "#{email}",
      "password": "#{password}",
      "grant_type": "password"
    }
   VALUES

    headers = {
      :content_type => 'application/json'
    }

    begin
      response = RestClient.post 'https://api.wink.com/oauth2/token', values, headers

      j_response = JSON.parse(response)

    @user = User.new(user_params)
    @user.auth_token = j_response["data"]["access_token"]
    @user.refresh_token = j_response["data"]["refresh_token"]


    if @user.save
      login_user!(@user)
      redirect_to user_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end

    rescue
      redirect_to new_user_url
    end
  end

  def new
    @user = User.new
    render :new
  end

  private
  
  def user_params
    params.require(:user).permit(:password, :email)
  end

end
