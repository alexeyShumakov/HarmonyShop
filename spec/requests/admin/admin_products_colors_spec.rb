require 'rails_helper'

RSpec.describe "Admin::ProductsColors", type: :request do
  describe "GET /admin_products_colors" do
    it "works! (now write some real specs)" do
      get admin_products_colors_path
      expect(response).to have_http_status(200)
    end
  end
end
