require 'rails_helper'

RSpec.describe "ProductsColors", type: :request do
  describe "GET /products_colors" do
    it "works! (now write some real specs)" do
      get products_colors_path
      expect(response).to have_http_status(200)
    end
  end
end
