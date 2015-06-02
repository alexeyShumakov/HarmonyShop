require 'rails_helper'

RSpec.describe "Admin::AdditionalDescriptions", type: :request do
  describe "GET /admin_additional_descriptions" do
    it "works! (now write some real specs)" do
      get admin_additional_descriptions_path
      expect(response).to have_http_status(200)
    end
  end
end
