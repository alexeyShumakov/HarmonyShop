class Color < ActiveRecord::Base
	has_many :products_colors
	has_many :products, through: :products_colors

	validates :name, presence: true
	validates :code, presence: true
end
