require 'rails_helper'

RSpec.describe "services/edit", type: :view do
  before(:each) do
    @service = assign(:service, Service.create!(
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit service form" do
    render

    assert_select "form[action=?][method=?]", service_path(@service), "post" do

      assert_select "input#service_title[name=?]", "service[title]"

      assert_select "textarea#service_body[name=?]", "service[body]"
    end
  end
end
