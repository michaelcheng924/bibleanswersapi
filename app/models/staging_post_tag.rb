class StagingPostTag < ApplicationRecord
  belongs_to :staging_post
  belongs_to :staging_tag
end
