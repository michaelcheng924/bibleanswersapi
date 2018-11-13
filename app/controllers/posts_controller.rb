class PostsController < ApplicationController
  before_action :authorize, only: [:create, :update, :destroy]

  def index
    render json: Post.all
  end

  def smallposts
    mapped_posts = Post.all.map do |post|
      {
        title: post.title,
        subtitle: post.subtitle,
        image_url_small: post.image_url_small,
        date_added: post.date_added
      }
    end

    render json: mapped_posts
  end

  def show
    post = Post.find_by(slug: params[:id])

    render json: post
  end

  def related
    post = Post.find_by(slug: params[:id])

    if !post
      render :json => {
        :items => []
      }
      return
    end

    mapped_related_posts_tags = []

    if post.related_posts_tags
      mapped_related_posts_tags = post.related_posts_tags.split(',').map do |tagId|
        Tag.find(tagId)
      end
    end

    related_posts = []

    mapped_related_posts_tags.each do |tag|
      tag.posts.each do |post|
        if post.slug != params[:id]
          related_posts << post
        end
      end
    end

    if related_posts.length < 10
      post.tags.each do |tag|
        tag.posts.each do |post|
          if related_posts.length < 10 && post.slug != params[:slug]
            related_posts << post
          end
        end
      end
    end

    render :json => {
      :items => related_posts
    }
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
