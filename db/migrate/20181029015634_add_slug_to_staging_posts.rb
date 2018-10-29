class AddSlugToStagingPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :staging_posts, :slug, :string
  end
end
