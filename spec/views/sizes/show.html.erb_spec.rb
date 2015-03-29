require 'rails_helper'

RSpec.describe "sizes/show", type: :view do
  before(:each) do
    @size = assign(:size, Size.create!(
      :name => "Name",
      :code => "Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Code/)
  end
end
