class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :slug
      t.string :url
      t.string :title
      t.string :description
      t.string :subtitle

      t.timestamps
    end
  end
end
