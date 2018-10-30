class TagSerializer < ActiveModel::Serializer
  attributes :id, :slug, :url, :title, :description, :subtitle, :posts
end
