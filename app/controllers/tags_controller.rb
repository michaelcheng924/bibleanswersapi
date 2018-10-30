class TagsController < ApplicationController
  before_action :authorize, only: [:create, :update, :destroy]

  def index
    render json: Tag.all
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
