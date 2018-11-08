class AddPropertiesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :description, :string
    add_column :users, :image, :string
    add_column :users, :link, :string
  end
end
