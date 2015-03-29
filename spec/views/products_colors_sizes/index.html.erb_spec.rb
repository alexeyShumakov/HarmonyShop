require 'rails_helper'

RSpec.describe "products_colors_sizes/index", type: :view do
  before(:each) do
    assign(:products_colors_sizes, [
      ProductsColorsSize.create!(
        :warehouse => 1,
        :products_color => nil,
        :size => nil
      ),
      ProductsColorsSize.create!(
        :warehouse => 1,
        :products_color => nil,
        :size => nil
      )
    ])
  end

  it "renders a list of products_colors_sizes" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
