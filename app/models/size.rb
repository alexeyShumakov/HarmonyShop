class Size < ActiveRecord::Base
	has_many :products_colors_sizes
	has_many :products_colors, through: :products_colors_sizes

	validates :name, presence: true
	validates :code, presence: true
end
