require 'rails_helper'

RSpec.describe "admin/products_colors/show", type: :view do
  before(:each) do
    @admin_products_color = assign(:admin_products_color, Admin::ProductsColor.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
