class Post < ApplicationRecord
  has_many :post_tags
  has_many :tags, through: :post_tags

  belongs_to :user, optional: true

  def as_json(options = {})
    {
      id: id,
      published: published,
      slug: slug,
      url: url,
      title: title,
      description: description,
      subtitle: subtitle,
      image_url: image_url,
      image_url_small: image_url_small,
      mapped_related_posts_tags: related_posts_tags.split(',').map { |id| Tag.find(id) },
      references: references,
      html: html,
      date_added: date_added,
      updated_at: updated_at,
      tags: tags.sort_by { |tag| tag.title.downcase }
    }
  end
end
