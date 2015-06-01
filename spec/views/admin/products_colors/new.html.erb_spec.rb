require 'rails_helper'

RSpec.describe "admin/products_colors/new", type: :view do
  before(:each) do
    assign(:admin_products_color, Admin::ProductsColor.new())
  end

  it "renders new admin_products_color form" do
    render

    assert_select "form[action=?][method=?]", admin_products_colors_path, "post" do
    end
  end
end
