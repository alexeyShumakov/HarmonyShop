require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :line_item => "",
        :user => nil,
        :pay_type => "Pay Type",
        :address => "Address",
        :phone => "Phone",
        :delivery_type => "Delivery Type"
      ),
      Order.create!(
        :line_item => "",
        :user => nil,
        :pay_type => "Pay Type",
        :address => "Address",
        :phone => "Phone",
        :delivery_type => "Delivery Type"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Pay Type".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Delivery Type".to_s, :count => 2
  end
end
