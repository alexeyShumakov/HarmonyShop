require 'rails_helper'

RSpec.describe "line_items/index", type: :view do
  before(:each) do
    assign(:line_items, [
      LineItem.create!(
        :products => nil,
        :cart => nil,
        :size => "Size",
        :color => "Color"
      ),
      LineItem.create!(
        :products => nil,
        :cart => nil,
        :size => "Size",
        :color => "Color"
      )
    ])
  end

  it "renders a list of line_items" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Size".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
  end
end
