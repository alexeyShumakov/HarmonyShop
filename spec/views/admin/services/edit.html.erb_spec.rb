require 'rails_helper'

RSpec.describe "admin/services/edit", type: :view do
  before(:each) do
    @admin_service = assign(:admin_service, Admin::Service.create!())
  end

  it "renders the edit admin_service form" do
    render

    assert_select "form[action=?][method=?]", admin_service_path(@admin_service), "post" do
    end
  end
end
