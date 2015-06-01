require 'rails_helper'

RSpec.describe "admin/colors/show", type: :view do
  before(:each) do
    @admin_color = assign(:admin_color, Admin::Color.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
