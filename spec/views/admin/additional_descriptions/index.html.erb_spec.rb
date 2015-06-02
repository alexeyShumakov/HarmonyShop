require 'rails_helper'

RSpec.describe "admin/additional_descriptions/index", type: :view do
  before(:each) do
    assign(:admin_additional_descriptions, [
      Admin::AdditionalDescription.create!(),
      Admin::AdditionalDescription.create!()
    ])
  end

  it "renders a list of admin/additional_descriptions" do
    render
  end
end
