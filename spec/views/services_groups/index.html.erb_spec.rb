require 'rails_helper'

RSpec.describe "services_groups/index", type: :view do
  before(:each) do
    assign(:services_groups, [
      ServicesGroup.create!(
        :title => "Title"
      ),
      ServicesGroup.create!(
        :title => "Title"
      )
    ])
  end

  it "renders a list of services_groups" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
