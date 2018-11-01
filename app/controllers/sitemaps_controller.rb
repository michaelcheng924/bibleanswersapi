class SitemapsController < ApplicationController
  def index
    render json: Sitemap.find(1)
  end

  def update
    sitemap = Sitemap.find(1)
    sitemap.update({ content: params[:content] })

    render json: sitemap
  end
end
