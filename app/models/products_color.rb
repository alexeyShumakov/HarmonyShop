class ProductsColor < ActiveRecord::Base
  has_many :products_colors_sizes
  has_many :sizes, through: :products_colors_sizes
  belongs_to :product
  belongs_to :color
end
