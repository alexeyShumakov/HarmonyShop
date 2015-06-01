require 'rails_helper'

RSpec.describe "admin/size_helpers/show", type: :view do
  before(:each) do
    @admin_size_helper = assign(:admin_size_helper, Admin::SizeHelper.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
