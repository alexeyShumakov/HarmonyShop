require 'rails_helper'

RSpec.describe "admin/bg_images/edit", type: :view do
  before(:each) do
    @admin_bg_image = assign(:admin_bg_image, Admin::BgImage.create!())
  end

  it "renders the edit admin_bg_image form" do
    render

    assert_select "form[action=?][method=?]", admin_bg_image_path(@admin_bg_image), "post" do
    end
  end
end
