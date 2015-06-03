require 'rails_helper'

RSpec.describe "admin/bg_images/new", type: :view do
  before(:each) do
    assign(:admin_bg_image, Admin::BgImage.new())
  end

  it "renders new admin_bg_image form" do
    render

    assert_select "form[action=?][method=?]", admin_bg_images_path, "post" do
    end
  end
end
