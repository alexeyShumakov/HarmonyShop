require 'rails_helper'

RSpec.describe "admin/services/show", type: :view do
  before(:each) do
    @admin_service = assign(:admin_service, Admin::Service.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
