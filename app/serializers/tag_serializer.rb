class TagSerializer < ActiveModel::Serializer
  attributes :id, :slug, :url, :title, :description, :subtitle, :image_url, :date_added, :updated_at, :post_slugs

  def post_slugs
    self.object.posts.map(&:slug)
  end
end
