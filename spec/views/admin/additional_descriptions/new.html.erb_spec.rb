require 'rails_helper'

RSpec.describe "admin/additional_descriptions/new", type: :view do
  before(:each) do
    assign(:admin_additional_description, Admin::AdditionalDescription.new())
  end

  it "renders new admin_additional_description form" do
    render

    assert_select "form[action=?][method=?]", admin_additional_descriptions_path, "post" do
    end
  end
end
