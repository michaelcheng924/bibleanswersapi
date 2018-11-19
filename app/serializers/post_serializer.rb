class PostSerializer < ActiveModel::Serializer
  attributes :id, :published, :slug, :url, :title, :description, :subtitle, :image_url, :image_url_small, :references, :html, :mapped_related_posts_tags, :date_added, :updated_at, :sorted_tags, :user

  def mapped_related_posts_tags
    if self.object.related_posts_tags
      return self.object.related_posts_tags.split(',').map do |tagId|
        Tag.find(tagId)
      end
    end

    return []
  end

  def sorted_tags
    self.object.tags.sort_by { |tag| tag.title.downcase }
  end

  def user
    User.first
  end
end
