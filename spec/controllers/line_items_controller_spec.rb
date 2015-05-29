require 'rails_helper'
RSpec.describe LineItemsController, type: :controller do
  login_admin

  # This should return the minimal set of attributes required to create a valid
  # LineItem. As you add validations to LineItem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {product_id: 1, color: 'red', size: 1, quantity: 2}
  }

  let(:invalid_attributes) {
    {product_id: nil, color: nil, size: nil, quantity: nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LineItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all line_items as @line_items" do
      line_item = create(:line_item)
      get :index, {}, valid_session
      expect(assigns(:line_items)).to eq([line_item])
    end
  end

  describe "GET #show" do
    it "assigns the requested line_item as @line_item" do
      line_item = create(:line_item)
      get :show, {:id => line_item.to_param}, valid_session
      expect(assigns(:line_item)).to eq(line_item)
    end
  end

  describe "GET #new" do
    it "assigns a new line_item as @line_item" do
      get :new, {}, valid_session
      expect(assigns(:line_item)).to be_a_new(LineItem)
    end
  end

  describe "GET #edit" do
    it "assigns the requested line_item as @line_item" do
      line_item = create(:line_item)
      get :edit, {:id => line_item.to_param}, valid_session
      expect(assigns(:line_item)).to eq(line_item)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new LineItem" do
        product = create(:product)
        expect {
          post :create, {:line_item => valid_attributes,
                         product_id: product.id,
                         size: 10,
                         color: 'red' }, valid_session
        }.to change(LineItem, :count).by(1)
      end

      it "assigns a newly created line_item as @line_item" do
        product = create(:product)
        post :create, {:line_item => valid_attributes,
                       product_id: product.id,
                       size: 10,
                       color: 'red' }, valid_session
        expect(assigns(:line_item)).to be_a(LineItem)
        expect(assigns(:line_item)).to be_persisted
      end

      it "redirects to the created line_item" do
        product = create(:product)
        post :create, {:line_item => valid_attributes,
                       product_id: product.id,
                       size: 10,
                       color: 'red' }, valid_session
        expect(response).to redirect_to(products_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved line_item as @line_item" do
        product = create(:product)
        post :create, {:line_item => invalid_attributes, :product_id => product.id}, valid_session
        expect(assigns(:line_item)).to be_a_new(LineItem)
      end

      it "re-renders the 'new' template" do
        product = create(:product)
        post :create, {:line_item => invalid_attributes, :product_id => product.id}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {color: 'green', size: 2, quantity: 20}
      }

      it "updates the requested line_item" do
        cart = create(:cart)
        product = create(:product)
        line_item = create(:line_item)
        new_attr = attributes_for(:new_line_item)
        cart.line_items << line_item
        put :update, {:id => line_item.to_param,
                      :line_item => new_attr,
                      :product_id => product.id }, {cart_id: cart.id}
        line_item.reload
        expect(line_item.color).to eq(new_attr[:color])
      end

      it "assigns the requested line_item as @line_item" do
        line_item = create(:line_item)
        put :update, {:id => line_item.to_param, :line_item => valid_attributes}, valid_session
        expect(assigns(:line_item)).to eq(line_item)
      end

      it "redirects to the products_url" do
        cart = create(:cart)
        product = create(:product)
        line_item = create(:line_item)
        cart.line_items << line_item
        put :update, {:id => line_item.to_param,
                      :line_item => attributes_for(:line_item),
                      :product_id => product.id }, {cart_id: cart.id}
        expect(response).to redirect_to(products_url)
      end
    end

    context "with invalid params" do
      it "assigns the line_item as @line_item" do
        line_item = create(:line_item)
        put :update, {:id => line_item.to_param, :line_item => invalid_attributes}, valid_session
        expect(assigns(:line_item)).to eq(line_item)
      end

      it "re-renders the 'edit' template" do
        cart = create(:cart)
        product = create(:product)
        line_item = create(:line_item)
        cart.line_items << line_item
        put :update, {:id => line_item.to_param,
                      :line_item => invalid_attributes,
                      :product_id => product.id }, {cart_id: cart.id}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested line_item" do
      cart = create(:cart)
      line_item = create(:line_item)
      cart.line_items << line_item
      expect {
        delete :destroy, {:id => line_item.to_param}, {cart_id: cart.id}
      }.to change(LineItem, :count).by(-1)
    end

    it "redirects to the line_items list" do
      cart = create(:cart)
      line_item = create(:line_item)
      cart.line_items << line_item
      delete :destroy, {:id => line_item.to_param}, {cart_id: cart.id}
      expect(response).to redirect_to(cart_custom_show_path)
    end
  end

end
