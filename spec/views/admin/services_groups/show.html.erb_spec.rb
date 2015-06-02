require 'rails_helper'

RSpec.describe "admin/services_groups/show", type: :view do
  before(:each) do
    @admin_services_group = assign(:admin_services_group, Admin::ServicesGroup.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
