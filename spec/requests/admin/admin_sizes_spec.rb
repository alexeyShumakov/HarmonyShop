require 'rails_helper'

RSpec.describe "Admin::Sizes", type: :request do
  describe "GET /admin_sizes" do
    it "works! (now write some real specs)" do
      get admin_sizes_path
      expect(response).to have_http_status(200)
    end
  end
end
