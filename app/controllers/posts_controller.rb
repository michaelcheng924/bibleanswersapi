class PostsController < ApplicationController
  before_action :authorize, only: [:create, :update, :destroy]

  def index
    render json: Post.all
  end

  def create
    post = Post.create(post_params)

    if params[:tag_ids]
      post.update(tag_ids: params[:tag_ids])
    end

    render json: post
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)

    if params[:tag_ids]
      post.update(tag_ids: params[:tag_ids])
    end

    render json: post
  end

  def destroy
    post = Post.destroy(params[:id])

    render json: post
  end

  private

  def post_params
    params.permit(:published, :slug, :url, :title, :description, :subtitle, :image_url, :image_url_small, :references, :html, :related_posts_tags, :date_added)
  end
end
