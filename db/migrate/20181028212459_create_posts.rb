class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.boolean :published
      t.string :slug
      t.string :url
      t.string :title
      t.string :description
      t.string :subtitle
      t.string :image_url
      t.string :image_url_small
      t.string :references
      t.string :html
      t.string :related_posts_tags
      t.string :date_added

      t.timestamps
    end
  end
end
