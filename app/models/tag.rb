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
      post_slugs: posts.map { |post| post.slugs }
    }
  end
end
