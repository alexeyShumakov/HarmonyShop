require 'rails_helper'


RSpec.describe CartsController, type: :controller do

  describe "GET #custom_show" do
    it "should find cart by cart_id" do
      cart = create(:cart)
      session[:cart_id] = cart.id
      get :custom_show, {}
      expect(assigns(:cart)).to eq(cart)
    end

    it "should create new cart" do
      expect {
        get :custom_show
      }.to change(Cart, :count).by(1)
    end

    it 'should set session' do
      get :custom_show
      expect(session[:cart_id]).to eq(Cart.last.id)
    end
  end

end
