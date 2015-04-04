class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def add_product(product_id, size, color)
		current_item = line_items.where({product_id: product_id, size: size, color: color }).first
		if current_item
				current_item.quantity += 1
		else
			current_item = line_items.build(product_id: product_id, size: size, color: color)
		end
		current_item
	end

	def total_price
		line_items.to_a.sum {|item| item.total_price}
	end

	def total_quantity
		line_items.sum(:quantity)
	end
end
