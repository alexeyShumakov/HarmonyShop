class CreateProductsColors < ActiveRecord::Migration
  def change
    create_table :products_colors do |t|
      t.references :product, index: true
      t.references :color, index: true

      t.timestamps null: false
    end
    add_foreign_key :products_colors, :products
    add_foreign_key :products_colors, :colors
  end
end
