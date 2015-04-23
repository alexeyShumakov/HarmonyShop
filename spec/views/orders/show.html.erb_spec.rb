require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :line_item => "",
      :user => nil,
      :pay_type => "Pay Type",
      :address => "Address",
      :phone => "Phone",
      :delivery_type => "Delivery Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Pay Type/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Delivery Type/)
  end
end
