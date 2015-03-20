class CategoriesProducts < ActiveRecord::Migration
  def up
    create_join_table :products, :categories do |t|
      t.index :product_id
      t.index :category_id
    end
  end

  def down
    drop_join_table :categories, :products
  end
end
