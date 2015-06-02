require 'rails_helper'

RSpec.describe "admin/additional_descriptions/show", type: :view do
  before(:each) do
    @admin_additional_description = assign(:admin_additional_description, Admin::AdditionalDescription.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
