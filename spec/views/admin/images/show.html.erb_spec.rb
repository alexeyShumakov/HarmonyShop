require 'rails_helper'

RSpec.describe "admin/images/show", type: :view do
  before(:each) do
    @admin_image = assign(:admin_image, Admin::Image.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
