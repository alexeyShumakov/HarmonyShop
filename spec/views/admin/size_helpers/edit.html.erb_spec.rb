require 'rails_helper'

RSpec.describe "admin/size_helpers/edit", type: :view do
  before(:each) do
    @admin_size_helper = assign(:admin_size_helper, Admin::SizeHelper.create!())
  end

  it "renders the edit admin_size_helper form" do
    render

    assert_select "form[action=?][method=?]", admin_size_helper_path(@admin_size_helper), "post" do
    end
  end
end
