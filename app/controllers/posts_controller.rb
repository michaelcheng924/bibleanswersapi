class PostsController < ApplicationController
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
    post = Post.find(params[:id])
    post.destroy(params[:id])

    render json: post
  end

  private

  def post_params
    params.permit(:title, :description, :subtitle, :references, :html, :related, :date_added, :last_updated, :tag_ids)
  end
end
