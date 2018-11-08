class ApplicationController < ActionController::API
  before_action :redirect_to_https

  def redirect_to_https
    redirect_to :protocol => "https://" unless (request.ssl? || request.local?)
  end

  def authorize
    authorization = request.headers["Authorization"]

    if authorization && User.find_by(username: JWT.decode(authorization.split(' ')[1], nil, false)[0])
      return true
    else
      raise "Error"
    end
  end
end
