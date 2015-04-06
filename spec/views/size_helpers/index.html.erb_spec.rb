require 'rails_helper'

RSpec.describe "size_helpers/index", type: :view do
  before(:each) do
    assign(:size_helpers, [
      SizeHelper.create!(
        :title => "Title",
        :body => "MyText"
      ),
      SizeHelper.create!(
        :title => "Title",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of size_helpers" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
