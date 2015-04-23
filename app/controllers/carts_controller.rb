class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def custom_show
  end

end
