class AddUrlToStagingPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :staging_posts, :url, :string
  end
end
