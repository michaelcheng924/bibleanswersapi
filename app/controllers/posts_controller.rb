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

  def admininfo
    render :json => {
      :posts => Post.all,
      :staging_posts => StagingPost.all,
      :tags => Tag.all,
      :staging_tags => StagingTag.all
    }
  end

  private

  def post_params
    params.permit(:slug, :url, :title, :description, :subtitle, :image_url, :image_url_small, :references, :html, :related_posts, :date_added, :last_updated, :tag_ids)
  end
end
