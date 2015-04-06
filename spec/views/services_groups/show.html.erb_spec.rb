require 'rails_helper'

RSpec.describe "services_groups/show", type: :view do
  before(:each) do
    @services_group = assign(:services_group, ServicesGroup.create!(
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
