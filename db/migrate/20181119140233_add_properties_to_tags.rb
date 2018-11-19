class AddPropertiesToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :image_url, :string
    add_column :tags, :date_added, :string
  end
end
