class PostSerializer < ActiveModel::Serializer
  attributes :id, :published, :slug, :url, :title, :description, :subtitle, :image_url, :image_url_small, :references, :html, :related_posts_tags, :date_added, :tags
end
