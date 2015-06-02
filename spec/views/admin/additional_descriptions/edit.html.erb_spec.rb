require 'rails_helper'

RSpec.describe "admin/additional_descriptions/edit", type: :view do
  before(:each) do
    @admin_additional_description = assign(:admin_additional_description, Admin::AdditionalDescription.create!())
  end

  it "renders the edit admin_additional_description form" do
    render

    assert_select "form[action=?][method=?]", admin_additional_description_path(@admin_additional_description), "post" do
    end
  end
end
