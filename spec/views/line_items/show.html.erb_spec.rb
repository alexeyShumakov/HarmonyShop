require 'rails_helper'

RSpec.describe "line_items/show", type: :view do
  before(:each) do
    @line_item = assign(:line_item, LineItem.create!(
      :products => nil,
      :cart => nil,
      :size => "Size",
      :color => "Color"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Size/)
    expect(rendered).to match(/Color/)
  end
end
