require 'rails_helper'

RSpec.describe "sizes/new", type: :view do
  before(:each) do
    assign(:size, Size.new(
      :name => "MyString",
      :code => "MyString"
    ))
  end

  it "renders new size form" do
    render

    assert_select "form[action=?][method=?]", sizes_path, "post" do

      assert_select "input#size_name[name=?]", "size[name]"

      assert_select "input#size_code[name=?]", "size[code]"
    end
  end
end
