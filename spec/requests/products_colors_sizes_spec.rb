require 'rails_helper'

RSpec.describe "ProductsColorsSizes", type: :request do
  describe "GET /products_colors_sizes" do
    it "works! (now write some real specs)" do
      get products_colors_sizes_path
      expect(response).to have_http_status(200)
    end
  end
end
