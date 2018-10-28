class StagingTagsController < ApplicationController
  def index
    render json: StagingTag.all
  end

  def create
    tag = StagingTag.create(tag_params)

    render json: tag
  end

  def update
    tag = StagingTag.find(params[:id])
    tag.update(tag_params)

    render json: tag
  end

  def destroy
    tag = StagingTag.find(params[:id])
    tag.destroy(params[:id])

    render json: tag
  end

  private

  def tag_params
    params.permit(:slug, :title, :description, :subtitle)
  end
end
