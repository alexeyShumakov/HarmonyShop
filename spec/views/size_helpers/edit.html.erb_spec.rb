require 'rails_helper'

RSpec.describe "size_helpers/edit", type: :view do
  before(:each) do
    @size_helper = assign(:size_helper, SizeHelper.create!(
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit size_helper form" do
    render

    assert_select "form[action=?][method=?]", size_helper_path(@size_helper), "post" do

      assert_select "input#size_helper_title[name=?]", "size_helper[title]"

      assert_select "textarea#size_helper_body[name=?]", "size_helper[body]"
    end
  end
end
