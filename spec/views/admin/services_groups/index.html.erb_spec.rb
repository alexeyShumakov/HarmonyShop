require 'rails_helper'

RSpec.describe "admin/services_groups/index", type: :view do
  before(:each) do
    assign(:admin_services_groups, [
      Admin::ServicesGroup.create!(),
      Admin::ServicesGroup.create!()
    ])
  end

  it "renders a list of admin/services_groups" do
    render
  end
end
