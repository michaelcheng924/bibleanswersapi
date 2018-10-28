class StagingTag < ApplicationRecord
  has_many :staging_post_tags
  has_many :staging_posts, through: :staging_post_tags
end
