require 'rails_helper'

RSpec.describe "sizes/index", type: :view do
  before(:each) do
    assign(:sizes, [
      Size.create!(
        :name => "Name",
        :code => "Code"
      ),
      Size.create!(
        :name => "Name",
        :code => "Code"
      )
    ])
  end

  it "renders a list of sizes" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
  end
end
