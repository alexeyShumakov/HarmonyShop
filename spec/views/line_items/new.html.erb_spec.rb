require 'rails_helper'

RSpec.describe "line_items/new", type: :view do
  before(:each) do
    assign(:line_item, LineItem.new(
      :products => nil,
      :cart => nil,
      :size => "MyString",
      :color => "MyString"
    ))
  end

  it "renders new line_item form" do
    render

    assert_select "form[action=?][method=?]", line_items_path, "post" do

      assert_select "input#line_item_products_id[name=?]", "line_item[products_id]"

      assert_select "input#line_item_cart_id[name=?]", "line_item[cart_id]"

      assert_select "input#line_item_size[name=?]", "line_item[size]"

      assert_select "input#line_item_color[name=?]", "line_item[color]"
    end
  end
end
