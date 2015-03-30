require 'rails_helper'

RSpec.describe "additional_descriptions/edit", type: :view do
  before(:each) do
    @additional_description = assign(:additional_description, AdditionalDescription.create!(
      :name => "MyString",
      :description => "MyString",
      :product => nil
    ))
  end

  it "renders the edit additional_description form" do
    render

    assert_select "form[action=?][method=?]", additional_description_path(@additional_description), "post" do

      assert_select "input#additional_description_name[name=?]", "additional_description[name]"

      assert_select "input#additional_description_description[name=?]", "additional_description[description]"

      assert_select "input#additional_description_product_id[name=?]", "additional_description[product_id]"
    end
  end
end
