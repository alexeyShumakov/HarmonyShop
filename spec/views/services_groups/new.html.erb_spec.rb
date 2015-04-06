require 'rails_helper'

RSpec.describe "services_groups/new", type: :view do
  before(:each) do
    assign(:services_group, ServicesGroup.new(
      :title => "MyString"
    ))
  end

  it "renders new services_group form" do
    render

    assert_select "form[action=?][method=?]", services_groups_path, "post" do

      assert_select "input#services_group_title[name=?]", "services_group[title]"
    end
  end
end
