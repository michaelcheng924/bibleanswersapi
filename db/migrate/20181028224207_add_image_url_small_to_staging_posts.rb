class AddImageUrlSmallToStagingPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :staging_posts, :image_url, :string
  end
end
