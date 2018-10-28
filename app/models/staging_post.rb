class StagingPost < ApplicationRecord
  has_many :staging_post_tags
  has_many :staging_tags, through: :staging_post_tags
end
