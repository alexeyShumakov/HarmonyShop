require 'rails_helper'

RSpec.describe "services/new", type: :view do
  before(:each) do
    assign(:service, Service.new(
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders new service form" do
    render

    assert_select "form[action=?][method=?]", services_path, "post" do

      assert_select "input#service_title[name=?]", "service[title]"

      assert_select "textarea#service_body[name=?]", "service[body]"
    end
  end
end
