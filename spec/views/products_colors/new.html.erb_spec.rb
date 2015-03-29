require 'rails_helper'

RSpec.describe "products_colors/new", type: :view do
  before(:each) do
    assign(:products_color, ProductsColor.new(
      :product => nil,
      :color => nil
    ))
  end

  it "renders new products_color form" do
    render

    assert_select "form[action=?][method=?]", products_colors_path, "post" do

      assert_select "input#products_color_product_id[name=?]", "products_color[product_id]"

      assert_select "input#products_color_color_id[name=?]", "products_color[color_id]"
    end
  end
end
