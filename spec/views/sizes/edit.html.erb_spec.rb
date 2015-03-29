require 'rails_helper'

RSpec.describe "sizes/edit", type: :view do
  before(:each) do
    @size = assign(:size, Size.create!(
      :name => "MyString",
      :code => "MyString"
    ))
  end

  it "renders the edit size form" do
    render

    assert_select "form[action=?][method=?]", size_path(@size), "post" do

      assert_select "input#size_name[name=?]", "size[name]"

      assert_select "input#size_code[name=?]", "size[code]"
    end
  end
end
