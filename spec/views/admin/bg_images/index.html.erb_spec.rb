require 'rails_helper'

RSpec.describe "admin/bg_images/index", type: :view do
  before(:each) do
    assign(:admin_bg_images, [
      Admin::BgImage.create!(),
      Admin::BgImage.create!()
    ])
  end

  it "renders a list of admin/bg_images" do
    render
  end
end
