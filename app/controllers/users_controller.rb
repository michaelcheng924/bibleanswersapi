class UsersController < ApplicationController
  def login
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      token = JWT.encode(params[:username], nil, 'none')
      render :json => {
        :success => true,
        :token => token
      }
    else
      render :json => {
        :success => false,
        :message => "Login failed"
      }, :status => 400
    end
  end

  def checktoken
    token = params[:token]
    user = nil

    if token
      username = JWT.decode(token, nil, false)[0]
      user = User.find_by(username: username)
    end

    if token && user
      render :json => {
        :success => true
      }
    else
      render :json => {
        :success => false,
        :message => "No token"
      }, :status => 400
    end
  end
end
