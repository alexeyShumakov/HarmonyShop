require 'rails_helper'

RSpec.describe "admin/colors/index", type: :view do
  before(:each) do
    assign(:admin_colors, [
      Admin::Color.create!(),
      Admin::Color.create!()
    ])
  end

  it "renders a list of admin/colors" do
    render
  end
end
