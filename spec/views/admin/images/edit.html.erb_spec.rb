require 'rails_helper'

RSpec.describe "admin/images/edit", type: :view do
  before(:each) do
    @admin_image = assign(:admin_image, Admin::Image.create!())
  end

  it "renders the edit admin_image form" do
    render

    assert_select "form[action=?][method=?]", admin_image_path(@admin_image), "post" do
    end
  end
end
