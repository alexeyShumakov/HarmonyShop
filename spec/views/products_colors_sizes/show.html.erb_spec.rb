require 'rails_helper'

RSpec.describe "products_colors_sizes/show", type: :view do
  before(:each) do
    @products_colors_size = assign(:products_colors_size, ProductsColorsSize.create!(
      :warehouse => 1,
      :products_color => nil,
      :size => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
