class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, dependent: :destroy

  validates :pay_type, :presence => true

  def total_price
    line_items.to_a.sum {|item| item.total_price}
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
