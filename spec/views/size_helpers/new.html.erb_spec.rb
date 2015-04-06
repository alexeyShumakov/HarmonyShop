require 'rails_helper'

RSpec.describe "size_helpers/new", type: :view do
  before(:each) do
    assign(:size_helper, SizeHelper.new(
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders new size_helper form" do
    render

    assert_select "form[action=?][method=?]", size_helpers_path, "post" do

      assert_select "input#size_helper_title[name=?]", "size_helper[title]"

      assert_select "textarea#size_helper_body[name=?]", "size_helper[body]"
    end
  end
end
