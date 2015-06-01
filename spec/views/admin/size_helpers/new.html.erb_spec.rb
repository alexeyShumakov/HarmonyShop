require 'rails_helper'

RSpec.describe "admin/size_helpers/new", type: :view do
  before(:each) do
    assign(:admin_size_helper, Admin::SizeHelper.new())
  end

  it "renders new admin_size_helper form" do
    render

    assert_select "form[action=?][method=?]", admin_size_helpers_path, "post" do
    end
  end
end
