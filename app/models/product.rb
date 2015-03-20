class Product < ActiveRecord::Base
	has_and_belongs_to_many :categories

	def assign_to_branch
	categories.clear
	@branch_nodes = Category.find(leaf_category_id).self_and_ancestors
	@branch_nodes.each { |node| categories << node }
	end
end
