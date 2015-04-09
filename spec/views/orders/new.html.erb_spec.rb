require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :line_item => "",
      :user => nil,
      :pay_type => "MyString",
      :address => "MyString",
      :phone => "MyString",
      :delivery_type => "MyString"
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input#order_line_item[name=?]", "order[line_item]"

      assert_select "input#order_user_id[name=?]", "order[user_id]"

      assert_select "input#order_pay_type[name=?]", "order[pay_type]"

      assert_select "input#order_address[name=?]", "order[address]"

      assert_select "input#order_phone[name=?]", "order[phone]"

      assert_select "input#order_delivery_type[name=?]", "order[delivery_type]"
    end
  end
end
