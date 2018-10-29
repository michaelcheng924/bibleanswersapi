class StagingPostsController < ApplicationController
  def index
    render json: StagingPost.all
  end

  def create
    post = StagingPost.create(post_params)

    render json: post
  end

  def update
    post = StagingPost.find(params[:id])
    post.update(post_params)

    render json: post
  end

  def destroy
    post = StagingPost.find(params[:id])
    post.destroy(params[:id])

    render json: post
  end

  private

  def post_params
    params.permit(:slug, :url, :title, :description, :subtitle, :image_url, :image_url_small, :references, :html, :related_posts, :date_added, :last_updated, :tag_ids)
  end
end
