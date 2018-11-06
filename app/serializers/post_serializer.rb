class PostSerializer < ActiveModel::Serializer
  attributes :id, :published, :slug, :url, :title, :description, :subtitle, :image_url, :image_url_small, :references, :html, :related_posts_tags, :mapped_related_posts_tags, :date_added, :updated_at, :tags

  def mapped_related_posts_tags
    if self.object.related_posts_tags
      return self.object.related_posts_tags.split(',').map do |tagId|
        Tag.find(tagId)
      end
    end

    return []
  end
end
