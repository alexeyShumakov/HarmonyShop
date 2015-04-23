require 'rails_helper'


RSpec.describe AdditionalDescriptionsController, type: :controller do
  login_admin

  # This should return the minimal set of attributes required to create a valid
  # AdditionalDescription. As you add validations to AdditionalDescription, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {name: 'name', description: 'code'}
  }

  let(:product_attributes) {
    {title: 'title', description: 'desc', price: 12.3, leaf_category_id: 1, article: 1234}
  }

  let(:invalid_attributes) {
    {name: nil, description: nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AdditionalDescriptionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all additional_descriptions as @additional_descriptions" do
      # see --> factories/products
      product = create(:product_with_add_desc)
      get :index, {product_id: product.id}, valid_session
      expect(assigns(:additional_descriptions)).to eq(product.additional_descriptions)
    end
  end

  describe "GET #show" do
    it "assigns the requested additional_description as @additional_description" do
      additional_description = AdditionalDescription.create! valid_attributes
      get :show, {product_id: 1, :id => additional_description.to_param}, valid_session
      expect(assigns(:additional_description)).to eq(additional_description)
    end
  end

  describe "GET #new" do
    it "assigns a new additional_description as @additional_description" do
      product = Product.create! product_attributes
      get :new, {product_id: product.id}, valid_session
      expect(assigns(:additional_description)).to be_a_new(AdditionalDescription)
    end
  end

  describe "GET #edit" do
    it "assigns the requested additional_description as @additional_description" do
      product = Product.create! product_attributes
      additional_description = AdditionalDescription.create! valid_attributes
      get :edit, {:id => additional_description.to_param, product_id: product.id}, valid_session
      expect(assigns(:additional_description)).to eq(additional_description)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new AdditionalDescription" do
        product = Product.create! product_attributes
        expect {
          post :create, {:additional_description => valid_attributes, product_id: product.id}, valid_session
        }.to change(AdditionalDescription, :count).by(1)
      end

      it "assigns a newly created additional_description as @additional_description" do
        product = Product.create! product_attributes
        post :create, {:additional_description => valid_attributes, product_id: product.id}, valid_session
        expect(assigns(:additional_description)).to be_a(AdditionalDescription)
        expect(assigns(:additional_description)).to be_persisted
      end

      it "redirects to the index products" do
        product = Product.create! product_attributes
        post :create, {:additional_description => valid_attributes, product_id: product.id}, valid_session
        expect(response).to redirect_to(products_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved additional_description as @additional_description" do
        product = Product.create! product_attributes
        post :create, {:additional_description => invalid_attributes, product_id: product.id}, valid_session
        expect(assigns(:additional_description)).to be_a_new(AdditionalDescription)
      end

      it "re-renders the 'new' template" do
        product = Product.create! product_attributes
        post :create, {:additional_description => invalid_attributes, product_id: product.id}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: 'new name', description: 'new desc'}
      }

      it "updates the requested additional_description" do
        product = Product.create! product_attributes
        additional_description = AdditionalDescription.create! valid_attributes
        put :update, {:id => additional_description.to_param,
                      :additional_description => new_attributes,
                      :product_id => product.id}, valid_session
        additional_description.reload
        expect(assigns(:additional_description)).to eq(additional_description)
      end

      it "assigns the requested additional_description as @additional_description" do
        product = Product.create! product_attributes
        additional_description = AdditionalDescription.create! valid_attributes
        put :update, {:id => additional_description.to_param,
                      :additional_description => valid_attributes,
                      :product_id => product.id}, valid_session
        expect(assigns(:additional_description)).to eq(additional_description)
      end

      it "redirects to the product index" do
        product = Product.create! product_attributes
        additional_description = AdditionalDescription.create! valid_attributes
        put :update, {:id => additional_description.to_param,
                      :additional_description => valid_attributes,
                      :product_id => product.id}, valid_session
        expect(response).to redirect_to(products_path)
      end
    end

    context "with invalid params" do
      it "assigns the additional_description as @additional_description" do
        product = Product.create! product_attributes
        additional_description = AdditionalDescription.create! valid_attributes
        put :update, {:id => additional_description.to_param,
                      :additional_description => valid_attributes,
                      :product_id => product.id}, valid_session
        expect(assigns(:additional_description)).to eq(additional_description)
      end

      it "re-renders the 'edit' template" do
        product = Product.create! product_attributes
        additional_description = AdditionalDescription.create! valid_attributes
        put :update, {:id => additional_description.to_param,
                      :additional_description => invalid_attributes,
                      :product_id => product.id}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested additional_description" do
      product = Product.create! product_attributes
      additional_description = AdditionalDescription.create! valid_attributes
      expect {
        delete :destroy, {:id => additional_description.to_param, :product_id => product.id}, valid_session
      }.to change(AdditionalDescription, :count).by(-1)
    end

    it "redirects to the additional_descriptions list" do
      product = Product.create! product_attributes
      additional_description = AdditionalDescription.create! valid_attributes
      delete :destroy, {:id => additional_description.to_param, :product_id => product.id}, valid_session
      expect(response).to redirect_to(products_path)
    end
  end

end
