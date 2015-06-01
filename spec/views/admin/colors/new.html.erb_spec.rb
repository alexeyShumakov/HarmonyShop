require 'rails_helper'

RSpec.describe "admin/colors/new", type: :view do
  before(:each) do
    assign(:admin_color, Admin::Color.new())
  end

  it "renders new admin_color form" do
    render

    assert_select "form[action=?][method=?]", admin_colors_path, "post" do
    end
  end
end
