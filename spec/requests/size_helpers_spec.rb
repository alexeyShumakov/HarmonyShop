require 'rails_helper'

RSpec.describe "SizeHelpers", type: :request do
  describe "GET /size_helpers" do
    it "works! (now write some real specs)" do
      get size_helpers_path
      expect(response).to have_http_status(200)
    end
  end
end
