require 'rails_helper'

RSpec.describe "admin/size_helpers/index", type: :view do
  before(:each) do
    assign(:admin_size_helpers, [
      Admin::SizeHelper.create!(),
      Admin::SizeHelper.create!()
    ])
  end

  it "renders a list of admin/size_helpers" do
    render
  end
end
