require 'rails_helper'

RSpec.describe "Admin::BgImages", type: :request do
  describe "GET /admin_bg_images" do
    it "works! (now write some real specs)" do
      get admin_bg_images_path
      expect(response).to have_http_status(200)
    end
  end
end
