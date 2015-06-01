require 'rails_helper'

RSpec.describe "admin/products_colors/index", type: :view do
  before(:each) do
    assign(:admin_products_colors, [
      Admin::ProductsColor.create!(),
      Admin::ProductsColor.create!()
    ])
  end

  it "renders a list of admin/products_colors" do
    render
  end
end
