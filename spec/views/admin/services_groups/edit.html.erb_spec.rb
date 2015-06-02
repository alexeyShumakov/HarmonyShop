require 'rails_helper'

RSpec.describe "admin/services_groups/edit", type: :view do
  before(:each) do
    @admin_services_group = assign(:admin_services_group, Admin::ServicesGroup.create!())
  end

  it "renders the edit admin_services_group form" do
    render

    assert_select "form[action=?][method=?]", admin_services_group_path(@admin_services_group), "post" do
    end
  end
end
