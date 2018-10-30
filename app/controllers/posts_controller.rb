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

  def initialfetch
    render :json => {
      :posts => Post.all,
      :tags => Tag.all
    }
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
    params.permit(:published, :slug, :url, :title, :description, :subtitle, :image_url, :image_url_small, :references, :html, :related_posts_tags, :date_added, :tag_ids)
  end
end
