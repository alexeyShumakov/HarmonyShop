require 'rails_helper'

RSpec.describe SubscribeController, type: :controller do

  describe "GET #Subscribe" do
    it "returns http success" do
      get :Subscribe
      expect(response).to have_http_status(:success)
    end
  end

end
