require 'rails_helper'

RSpec.describe ProductsColorsController, type: :controller do
  login_admin

  # This should return the minimal set of attributes required to create a valid
  # ProductsColor. As you add validations to ProductsColor, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {product_id: 1, color_id: 1}
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProductsColorsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all products_colors as @products_colors" do
      products_color = ProductsColor.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:products_colors)).to eq([products_color])
    end

  end

  describe "GET #show" do
    it "assigns the requested products_color as @products_color" do
      products_color = ProductsColor.create! valid_attributes
      get :show, {:id => products_color.to_param}, valid_session
      expect(assigns(:products_color)).to eq(products_color)
    end

    it "delete session variable 'size'" do
      products_color = ProductsColor.create! valid_attributes
      get :show, {:id => products_color.to_param}, {size: 14}
      expect(session[:size]).to eq(nil)
    end
  end

  describe "GET #new" do
    it "assigns a new products_color as @products_color" do
      get :new, {}, valid_session
      expect(assigns(:products_color)).to be_a_new(ProductsColor)
    end
  end

  describe "GET #edit" do
    it "assigns the requested products_color as @products_color" do
      products_color = ProductsColor.create! valid_attributes
      get :edit, {:id => products_color.to_param}, valid_session
      expect(assigns(:products_color)).to eq(products_color)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ProductsColor" do
        expect {
          post :create, {:products_color => valid_attributes}, valid_session
        }.to change(ProductsColor, :count).by(1)
      end

      it "assigns a newly created products_color as @products_color" do
        post :create, {:products_color => valid_attributes}, valid_session
        expect(assigns(:products_color)).to be_a(ProductsColor)
        expect(assigns(:products_color)).to be_persisted
      end

      it "redirects to the products" do
        post :create, {:products_color => valid_attributes}, valid_session
        expect(response).to redirect_to(products_path)
      end
    end

  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {product_id: 2, color_id: 2}
      }

      it "updates the requested products_color" do
        products_color = ProductsColor.create! valid_attributes
        put :update, {:id => products_color.to_param, :products_color => new_attributes}, valid_session
        products_color.reload
        expect(assigns(:products_color)).to eq(products_color)
      end

      it "assigns the requested products_color as @products_color" do
        products_color = ProductsColor.create! valid_attributes
        put :update, {:id => products_color.to_param, :products_color => valid_attributes}, valid_session
        expect(assigns(:products_color)).to eq(products_color)
      end

      it "redirects to the products" do
        products_color = ProductsColor.create! valid_attributes
        put :update, {:id => products_color.to_param, :products_color => valid_attributes}, valid_session
        expect(response).to redirect_to(products_path)
      end
    end

  end

  describe "DELETE #destroy" do
    it "destroys the requested products_color" do
      products_color = ProductsColor.create! valid_attributes
      expect {
        delete :destroy, {:id => products_color.to_param}, valid_session
      }.to change(ProductsColor, :count).by(-1)
    end

    it "redirects to the products_colors list" do
      products_color = ProductsColor.create! valid_attributes
      delete :destroy, {:id => products_color.to_param}, valid_session
      expect(response).to redirect_to(products_colors_url)
    end
  end

end
