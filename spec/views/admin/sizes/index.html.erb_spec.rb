require 'rails_helper'

RSpec.describe "admin/sizes/index", type: :view do
  before(:each) do
    assign(:admin_sizes, [
      Admin::Size.create!(),
      Admin::Size.create!()
    ])
  end

  it "renders a list of admin/sizes" do
    render
  end
end
