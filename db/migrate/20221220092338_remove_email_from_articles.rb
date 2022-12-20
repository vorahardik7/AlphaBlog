class RemoveEmailFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :email, :string
  end
end
