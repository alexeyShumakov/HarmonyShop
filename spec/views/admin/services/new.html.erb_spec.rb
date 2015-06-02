require 'rails_helper'

RSpec.describe "admin/services/new", type: :view do
  before(:each) do
    assign(:admin_service, Admin::Service.new())
  end

  it "renders new admin_service form" do
    render

    assert_select "form[action=?][method=?]", admin_services_path, "post" do
    end
  end
end
