require 'rails_helper'

RSpec.describe "admin/sizes/show", type: :view do
  before(:each) do
    @admin_size = assign(:admin_size, Admin::Size.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
