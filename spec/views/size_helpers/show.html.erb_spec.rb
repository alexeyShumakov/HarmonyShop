require 'rails_helper'

RSpec.describe "size_helpers/show", type: :view do
  before(:each) do
    @size_helper = assign(:size_helper, SizeHelper.create!(
      :title => "Title",
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
