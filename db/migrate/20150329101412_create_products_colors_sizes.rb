class CreateProductsColorsSizes < ActiveRecord::Migration
  def change
    create_table :products_colors_sizes do |t|
      t.integer :warehouse
      t.references :products_color, index: true
      t.references :size, index: true

      t.timestamps null: false
    end
    add_foreign_key :products_colors_sizes, :products_colors
    add_foreign_key :products_colors_sizes, :sizes
  end
end
