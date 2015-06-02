require 'rails_helper'

RSpec.describe "admin/services/index", type: :view do
  before(:each) do
    assign(:admin_services, [
      Admin::Service.create!(),
      Admin::Service.create!()
    ])
  end

  it "renders a list of admin/services" do
    render
  end
end
