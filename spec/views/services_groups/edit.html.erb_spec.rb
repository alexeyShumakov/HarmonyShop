require 'rails_helper'

RSpec.describe "services_groups/edit", type: :view do
  before(:each) do
    @services_group = assign(:services_group, ServicesGroup.create!(
      :title => "MyString"
    ))
  end

  it "renders the edit services_group form" do
    render

    assert_select "form[action=?][method=?]", services_group_path(@services_group), "post" do

      assert_select "input#services_group_title[name=?]", "services_group[title]"
    end
  end
end
