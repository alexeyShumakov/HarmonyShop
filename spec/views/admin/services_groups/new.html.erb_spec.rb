require 'rails_helper'

RSpec.describe "admin/services_groups/new", type: :view do
  before(:each) do
    assign(:admin_services_group, Admin::ServicesGroup.new())
  end

  it "renders new admin_services_group form" do
    render

    assert_select "form[action=?][method=?]", admin_services_groups_path, "post" do
    end
  end
end
