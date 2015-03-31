class AddArticleToProducts < ActiveRecord::Migration
  def change
    add_column :products, :article, :integer
  end
end
