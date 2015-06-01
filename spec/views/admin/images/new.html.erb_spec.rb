require 'rails_helper'

RSpec.describe "admin/images/new", type: :view do
  before(:each) do
    assign(:admin_image, Admin::Image.new())
  end

  it "renders new admin_image form" do
    render

    assert_select "form[action=?][method=?]", admin_images_path, "post" do
    end
  end
end
