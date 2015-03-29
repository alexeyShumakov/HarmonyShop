class ProductsColorsSize < ActiveRecord::Base
  belongs_to :products_color
  belongs_to :size
end
