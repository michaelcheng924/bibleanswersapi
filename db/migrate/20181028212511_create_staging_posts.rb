class CreateStagingPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :staging_posts do |t|
      t.string :title
      t.string :description
      t.string :subtitle
      t.belongs_to :tag, foreign_key: true
      t.string :references
      t.string :html
      t.string :related_posts
      t.string :date_added
      t.string :last_updated

      t.timestamps
    end
  end
end
