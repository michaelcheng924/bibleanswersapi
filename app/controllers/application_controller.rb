class ApplicationController < ActionController::API
  def authorize
    authorization = request.headers["Authorization"]

    if authorization && User.find_by(username: JWT.decode(authorization.split(' ')[1], nil, false)[0])
      return true
    else
      raise "Error"
    end
  end

  def initialfetch
    render :json => {
      :posts => Post.all,
      :tags => Tag.all
    }
  end

  def passages
    result = RestClient.get("https://api.esv.org/v3/passage/text/?q=#{URI::encode(params[:passages])}", { Authorization: '231ff21ec1223742fb4e7e65e23ac642b4cef0af' })

    render json: result
  end
end
