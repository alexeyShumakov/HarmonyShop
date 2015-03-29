require 'rails_helper'

RSpec.describe "products_colors/index", type: :view do
  before(:each) do
    assign(:products_colors, [
      ProductsColor.create!(
        :product => nil,
        :color => nil
      ),
      ProductsColor.create!(
        :product => nil,
        :color => nil
      )
    ])
  end

  it "renders a list of products_colors" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
