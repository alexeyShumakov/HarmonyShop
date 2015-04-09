class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, dependent: :destroy

  def total_price
    line_items.sum(:price)
  end

  def add_item_from_cart(cart)
    cart.line_items.each do |line_item|
      line_item.cart_id = nil
      line_item.set_price
      line_items << line_item
    end
    cart.destroy
  end
end
