require 'rails_helper'

RSpec.describe "admin/bg_images/show", type: :view do
  before(:each) do
    @admin_bg_image = assign(:admin_bg_image, Admin::BgImage.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
