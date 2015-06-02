require 'rails_helper'

RSpec.describe "Admin::Services", type: :request do
  describe "GET /admin_services" do
    it "works! (now write some real specs)" do
      get admin_services_path
      expect(response).to have_http_status(200)
    end
  end
end
