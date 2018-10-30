class PostsController < ApplicationController
  before_action :authorize, only: [:create, :update, :destroy]

  def index
    render json: Post.all
  end

  def create
    post = Post.create(post_params)

    render json: post
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)

    render json: post
  end

  def destroy
    post = Post.destroy(params[:id])

    render json: post
  end

  def initialfetch
    render :json => {
      :posts => Post.all,
      :tags => Tag.all
    }
  end

  private

  def post_params
    params.permit(:published, :slug, :url, :title, :description, :subtitle, :image_url, :image_url_small, :references, :html, :related_posts_tags, :date_added, :tag_ids)
  end
end
