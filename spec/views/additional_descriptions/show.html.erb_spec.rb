require 'rails_helper'

RSpec.describe "additional_descriptions/show", type: :view do
  before(:each) do
    @additional_description = assign(:additional_description, AdditionalDescription.create!(
      :name => "Name",
      :description => "Description",
      :product => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
  end
end
