class CreateStagingPostTags < ActiveRecord::Migration[5.2]
  def change
    create_table :staging_post_tags do |t|
      t.belongs_to :staging_post, foreign_key: true
      t.belongs_to :staging_tag, foreign_key: true

      t.timestamps
    end
  end
end
