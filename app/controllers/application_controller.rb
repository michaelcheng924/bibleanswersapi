class ApplicationController < ActionController::API
  def authorize
    authorization = request.headers["Authorization"]

    if authorization && User.find_by(username: JWT.decode(authorization.split(' ')[1], nil, false)[0])
      return true
    else
      return false
    end
  end
end
