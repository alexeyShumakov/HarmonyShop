require 'rails_helper'

RSpec.describe "AdditionalDescriptions", type: :request do
  describe "GET /additional_descriptions" do
    it "works! (now write some real specs)" do
      get additional_descriptions_path
      expect(response).to have_http_status(200)
    end
  end
end
