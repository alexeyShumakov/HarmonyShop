class ProductsColorsSize < ActiveRecord::Base
  belongs_to :products_color
  belongs_to :size

  validates :warehouse, numericality: {only_integer: true}

  after_initialize :init

  def init
    self.warehouse  ||= 0
  end
end
