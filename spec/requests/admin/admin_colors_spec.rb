require 'rails_helper'

RSpec.describe "Admin::Colors", type: :request do
  describe "GET /admin_colors" do
    it "works! (now write some real specs)" do
      get admin_colors_path
      expect(response).to have_http_status(200)
    end
  end
end
