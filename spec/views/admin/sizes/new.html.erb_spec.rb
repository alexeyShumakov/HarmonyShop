require 'rails_helper'

RSpec.describe "admin/sizes/new", type: :view do
  before(:each) do
    assign(:admin_size, Admin::Size.new())
  end

  it "renders new admin_size form" do
    render

    assert_select "form[action=?][method=?]", admin_sizes_path, "post" do
    end
  end
end
