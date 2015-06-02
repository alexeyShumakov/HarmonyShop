require 'rails_helper'

RSpec.describe "admin/sizes/edit", type: :view do
  before(:each) do
    @admin_size = assign(:admin_size, Admin::Size.create!())
  end

  it "renders the edit admin_size form" do
    render

    assert_select "form[action=?][method=?]", admin_size_path(@admin_size), "post" do
    end
  end
end
