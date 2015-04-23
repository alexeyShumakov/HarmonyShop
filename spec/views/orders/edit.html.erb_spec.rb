require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :line_item => "",
      :user => nil,
      :pay_type => "MyString",
      :address => "MyString",
      :phone => "MyString",
      :delivery_type => "MyString"
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input#order_line_item[name=?]", "order[line_item]"

      assert_select "input#order_user_id[name=?]", "order[user_id]"

      assert_select "input#order_pay_type[name=?]", "order[pay_type]"

      assert_select "input#order_address[name=?]", "order[address]"

      assert_select "input#order_phone[name=?]", "order[phone]"

      assert_select "input#order_delivery_type[name=?]", "order[delivery_type]"
    end
  end
end
