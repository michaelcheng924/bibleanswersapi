class TagsController < ApplicationController
  before_action :authorize, only: [:create, :update, :destroy]

  def index
    render json: Tag.all.sort_by { |tag| tag.title.downcase }
  end

  def tags_for_all_posts
    tags_with_posts = Tag.all.select do |tag|
      tag.posts.select do |post|
        post.published && post.date_added
      end.length > 0
    end

    sorted_tags = tags_with_posts.sort_by do |tag|
      tag.title.downcase
    end

    mapped_tags = sorted_tags.map do |tag|
      filtered_posts = tag.posts.select do |post|
        post.published && post.date_added
      end

      mapped_posts = filtered_posts.map do |post|
        {
          title: post.title,
          subtitle: post.subtitle,
          url: post.url,
          image_url_small: post.image_url_small
        }
      end

      sorted_posts = mapped_posts.sort_by do |post|
        post[:title].downcase
      end

      {
        title: tag.title,
        url: tag.url,
        posts: sorted_posts
      }
    end

    render :json => {
      :tags => mapped_tags,
      :posts_count => Post.all.select do |post|
        post.published && post.date_added
      end.length
    }
  end

  def show
    tag = Tag.find_by(slug: params[:id])

    if !tag
      render :json => {
        :message => "Tag not found"
      }
      return
    end

    filtered_posts = tag.posts.select do |post|
      post.published && post.date_added
    end

    mapped_posts = filtered_posts.map do |post|
      {
        title: post.title,
        subtitle: post.subtitle,
        url: post.url,
        image_url_small: post.image_url_small,
        date_added: post.date_added
      }
    end

    render :json => {
      title: tag.title,
      subtitle: tag.subtitle,
      description: tag.description,
      posts: mapped_posts
    }
  end

  def create
    if authorize
      tag = Tag.create(tag_params)

      render :json => {
        :success => true,
        :tag => tag
      }
    else
      render :json => {
        :success => false
      }
    end
  end

  def update
    tag = Tag.find(params[:id])
    tag.update(tag_params)

    render json: tag
  end

  def destroy
    tag = Tag.destroy(params[:id])

    render json: tag
  end

  private

  def tag_params
    params.permit(:slug, :url, :title, :description, :subtitle)
  end
end
