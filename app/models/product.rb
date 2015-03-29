class Product < ActiveRecord::Base
	has_and_belongs_to_many :categories
	has_many :products_colors, dependent: :destroy
	has_many :colors, through: :products_colors
	default_scope ->{ order('updated_at DESC') }
	paginates_per 6
	def assign_to_branch
	categories.clear
	@branch_nodes = Category.find(leaf_category_id).self_and_ancestors
	@branch_nodes.each { |node| categories << node }
	end
end
