require 'rails_helper'

RSpec.describe "Admin::SizeHelpers", type: :request do
  describe "GET /admin_size_helpers" do
    it "works! (now write some real specs)" do
      get admin_size_helpers_path
      expect(response).to have_http_status(200)
    end
  end
end
