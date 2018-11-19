class Tag < ApplicationRecord
  has_many :post_tags
  has_many :posts, through: :post_tags

  def as_json(options = {})
    {
      id: id,
      slug: slug,
      url: url,
      title: title,
      description: description,
      subtitle: subtitle,
      image_url: image_url,
      date_added: date_added,
      updated_at: updated_at,
      post_slugs: posts.map(&:slug)
    }
  end
end
