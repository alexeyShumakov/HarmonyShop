require 'rails_helper'

RSpec.describe "admin/products_colors/edit", type: :view do
  before(:each) do
    @admin_products_color = assign(:admin_products_color, Admin::ProductsColor.create!())
  end

  it "renders the edit admin_products_color form" do
    render

    assert_select "form[action=?][method=?]", admin_products_color_path(@admin_products_color), "post" do
    end
  end
end
