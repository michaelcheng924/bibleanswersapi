class CreateStagingTags < ActiveRecord::Migration[5.2]
  def change
    create_table :staging_tags do |t|
      t.string :slug
      t.string :title
      t.string :description
      t.string :subtitle
      t.belongs_to :staging_post

      t.timestamps
    end
  end
end
