require 'rails_helper'

RSpec.describe "products_colors_sizes/new", type: :view do
  before(:each) do
    assign(:products_colors_size, ProductsColorsSize.new(
      :warehouse => 1,
      :products_color => nil,
      :size => nil
    ))
  end

  it "renders new products_colors_size form" do
    render

    assert_select "form[action=?][method=?]", products_colors_sizes_path, "post" do

      assert_select "input#products_colors_size_warehouse[name=?]", "products_colors_size[warehouse]"

      assert_select "input#products_colors_size_products_color_id[name=?]", "products_colors_size[products_color_id]"

      assert_select "input#products_colors_size_size_id[name=?]", "products_colors_size[size_id]"
    end
  end
end
