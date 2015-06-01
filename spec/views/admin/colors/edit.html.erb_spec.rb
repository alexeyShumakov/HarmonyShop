require 'rails_helper'

RSpec.describe "admin/colors/edit", type: :view do
  before(:each) do
    @admin_color = assign(:admin_color, Admin::Color.create!())
  end

  it "renders the edit admin_color form" do
    render

    assert_select "form[action=?][method=?]", admin_color_path(@admin_color), "post" do
    end
  end
end
