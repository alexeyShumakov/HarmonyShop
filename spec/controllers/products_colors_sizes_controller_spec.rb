require 'rails_helper'

RSpec.describe ProductsColorsSizesController, type: :controller do
  login_admin

  # This should return the minimal set of attributes required to create a valid
  # ProductsColorsSize. As you add validations to ProductsColorsSize, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {warehouse: 2}
  }
  let(:size_attributes) {
    {code: 'code', name: 'name', id: 1}
  }

  let(:invalid_attributes) {
    {warehouse: 'string'}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProductsColorsSizesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all products_colors_sizes as @products_colors_sizes" do
      Size.create! size_attributes
      products_colors_size = ProductsColorsSize.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:products_colors_sizes)) == [products_colors_size]
    end
  end

  describe "GET #show" do
    it "assigns the requested products_colors_size as @products_colors_size" do
      products_colors_size = create(:products_colors_size)
      get :show, {:id => products_colors_size.to_param}, valid_session
      expect(assigns(:products_colors_size)).to eq(products_colors_size)
    end
    it "assigns new session variable as size.code" do
      products_colors_size = create(:products_colors_size)
      get :show, {:id => products_colors_size.to_param}, valid_session
      expect(session[:size]).to eq(products_colors_size.size.code)
    end
  end

  describe "GET #new" do
    it "assigns a new products_colors_size as @products_colors_size" do
      get :new, {}, valid_session
      expect(assigns(:products_colors_size)).to be_a_new(ProductsColorsSize)
    end
  end

  describe "GET #edit" do
    it "assigns the requested products_colors_size as @products_colors_size" do
      products_colors_size = ProductsColorsSize.create! valid_attributes
      get :edit, {:id => products_colors_size.to_param}, valid_session
      expect(assigns(:products_colors_size)).to eq(products_colors_size)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ProductsColorsSize" do
        expect {
          post :create, {:products_colors_size => valid_attributes}, valid_session
        }.to change(ProductsColorsSize, :count).by(1)
      end

      it "assigns a newly created products_colors_size as @products_colors_size" do
        post :create, {:products_colors_size => valid_attributes}, valid_session
        expect(assigns(:products_colors_size)).to be_a(ProductsColorsSize)
        expect(assigns(:products_colors_size)).to be_persisted
      end

      it "redirects to the created products_colors_size" do
        post :create, {:products_colors_size => valid_attributes}, valid_session
        expect(response).to redirect_to(products_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved products_colors_size as @products_colors_size" do
        post :create, {:products_colors_size => invalid_attributes}, valid_session
        expect(assigns(:products_colors_size)).to be_a_new(ProductsColorsSize)
      end

      it "re-renders the 'new' template" do
        post :create, {:products_colors_size => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {warehouse: 15}
      }

      it "updates the requested products_colors_size" do
        products_colors_size = ProductsColorsSize.create! valid_attributes
        put :update, {:id => products_colors_size.to_param, :products_colors_size => new_attributes}, valid_session
        products_colors_size.reload
        expect(assigns(:products_colors_size)).to eq(products_colors_size)
      end

      it "assigns the requested products_colors_size as @products_colors_size" do
        products_colors_size = ProductsColorsSize.create! valid_attributes
        put :update, {:id => products_colors_size.to_param, :products_colors_size => valid_attributes}, valid_session
        expect(assigns(:products_colors_size)).to eq(products_colors_size)
      end

      it "redirects to the products" do
        products_colors_size = ProductsColorsSize.create! valid_attributes
        put :update, {:id => products_colors_size.to_param, :products_colors_size => valid_attributes}, valid_session
        expect(response).to redirect_to(products_path)
      end
    end

    context "with invalid params" do
      it "assigns the products_colors_size as @products_colors_size" do
        products_colors_size = ProductsColorsSize.create! valid_attributes
        put :update, {:id => products_colors_size.to_param, :products_colors_size => invalid_attributes}, valid_session
        expect(assigns(:products_colors_size)).to eq(products_colors_size)
      end

      it "re-renders the 'edit' template" do
        products_colors_size = ProductsColorsSize.create! valid_attributes
        put :update, {:id => products_colors_size.to_param, :products_colors_size => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested products_colors_size" do
      products_colors_size = ProductsColorsSize.create! valid_attributes
      expect {
        delete :destroy, {:id => products_colors_size.to_param}, valid_session
      }.to change(ProductsColorsSize, :count).by(-1)
    end

    it "redirects to the products_colors_sizes list" do
      products_colors_size = ProductsColorsSize.create! valid_attributes
      delete :destroy, {:id => products_colors_size.to_param}, valid_session
      expect(response).to redirect_to(products_colors_sizes_url)
    end
  end

end
