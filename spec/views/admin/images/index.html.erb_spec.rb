require 'rails_helper'

RSpec.describe "admin/images/index", type: :view do
  before(:each) do
    assign(:admin_images, [
      Admin::Image.create!(),
      Admin::Image.create!()
    ])
  end

  it "renders a list of admin/images" do
    render
  end
end
