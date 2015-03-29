require 'rails_helper'

RSpec.describe "products_colors/edit", type: :view do
  before(:each) do
    @products_color = assign(:products_color, ProductsColor.create!(
      :product => nil,
      :color => nil
    ))
  end

  it "renders the edit products_color form" do
    render

    assert_select "form[action=?][method=?]", products_color_path(@products_color), "post" do

      assert_select "input#products_color_product_id[name=?]", "products_color[product_id]"

      assert_select "input#products_color_color_id[name=?]", "products_color[color_id]"
    end
  end
end
