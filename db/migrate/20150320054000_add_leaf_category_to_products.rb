class AddLeafCategoryToProducts < ActiveRecord::Migration
  def change
    add_column :products, :leaf_category_id, :integer
  end
end
