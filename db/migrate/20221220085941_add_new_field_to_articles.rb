class AddNewFieldToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :read, :boolean
  end
end
