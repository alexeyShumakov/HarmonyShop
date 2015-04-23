class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  validates :product_id, presence: true, numericality: {only_integer: true}
  validates :color, presence: true
  validates :size, presence: true
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}


  def total_price
    product.price * quantity
  end

  def get_image
    current_color = Color.find_by(name: color)

    image = product.products_colors.find_by(color: current_color).images.first
    if image
      image.photo.url(:small)
    else
      'small/default_product_average.png'
    end
  end

  def get_color_id
    Color.find_by(name: color)
  end

  def set_price
    self.price = product.price
  end
end
