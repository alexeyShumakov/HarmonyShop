require 'rails_helper'

RSpec.describe "products_colors/show", type: :view do
  before(:each) do
    @products_color = assign(:products_color, ProductsColor.create!(
      :product => nil,
      :color => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
