require 'rails_helper'


RSpec.describe OrdersController, type: :controller do
  login_admin
  # This should return the minimal set of attributes required to create a valid
  # Order. As you add validations to Order, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
     :pay_type => 'card',
     :address => 'address',
     :phone => 3451303,
     :delivery_type => 'couriers' }
  }

  let(:invalid_attributes) {
    { :pay_type => nil,
      :address => nil,
      :phone => nil,
      :delivery_type => nil }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OrdersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all orders as @orders" do
      order = Order.create! valid_attributes
      user = create(:user)
      user.orders << order
      get :index, {:user_id => user.id}, valid_session
      expect(assigns(:orders)).to eq([order])
    end
  end

  describe "GET #show" do
    it "assigns the requested order as @order" do
      order = Order.create! valid_attributes
      get :show, {:id => order.to_param}, valid_session
      expect(assigns(:order)).to eq(order)
    end
  end

  describe "GET #new" do
    it "assigns a new order as @order" do
      user = create(:user)
      get :new, {:user_id => user.id}, valid_session
      expect(assigns(:order)).to be_a_new(Order)
    end
  end

  describe "GET #edit" do
    it "assigns the requested order as @order" do
      order = Order.create! valid_attributes
      get :edit, {:id => order.to_param}, valid_session
      expect(assigns(:order)).to eq(order)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Order" do
        user = create(:user)
        expect {
          post :create, {:order => valid_attributes, :user_id => user.id}, valid_session
        }.to change(Order, :count).by(1)
      end

      it "assigns a newly created order as @order" do
        user = create(:user)
        post :create, {:order => valid_attributes, :user_id => user.id}, valid_session
        expect(assigns(:order)).to be_a(Order)
        expect(assigns(:order)).to be_persisted
      end

      it "redirects to the created order" do
        user = create(:user)
        post :create, {:order => valid_attributes,:user_id => user.id}, valid_session
        expect(response).to redirect_to(private_office_url)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved order as @order" do
        user = create(:user)
        post :create, {:order => invalid_attributes, :user_id => user.id}, valid_session
        expect(assigns(:order)).to be_a_new(Order)
      end

      it "re-renders the 'new' template" do
        user = create(:user)
        post :create, {:order => invalid_attributes, :user_id => user.id}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          :pay_type => 'cache',
          :address => 'address',
          :phone => 3451303,
          :delivery_type => 'couriers'
        }
      }

      it "updates the requested order" do
        user = create(:user)
        order = Order.create! valid_attributes
        put :update, {:user_id => user.id, :id => order.to_param, :order => new_attributes}, valid_session
        order.reload
        expect(order.pay_type).to eq(new_attributes[:pay_type])
      end

      it "assigns the requested order as @order" do
        user = create(:user)
        order = Order.create! valid_attributes
        put :update, {:user_id => user.id, :id => order.to_param, :order => valid_attributes}, valid_session
        expect(assigns(:order)).to eq(order)
      end

      it "redirects to the order" do
        user = create(:user)
        order = Order.create! valid_attributes
        put :update, {:user_id => user.id, :id => order.to_param, :order => valid_attributes}, valid_session
        expect(response).to redirect_to(order)
      end
    end

    context "with invalid params" do
      it "assigns the order as @order" do
        user = create(:user)
        order = Order.create! valid_attributes
        put :update, {:user_id => user.id, :id => order.to_param, :order => invalid_attributes}, valid_session
        expect(assigns(:order)).to eq(order)
      end

      it "re-renders the 'edit' template" do
        user = create(:user)
        order = Order.create! valid_attributes
        put :update, {:user_id => user.id, :id => order.to_param, :order => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested order" do
      order = Order.create! valid_attributes
      expect {
        delete :destroy, {:id => order.to_param}, valid_session
      }.to change(Order, :count).by(-1)
    end

    it "redirects to the orders list" do
      order = Order.create! valid_attributes
      delete :destroy, {:id => order.to_param}, valid_session
      expect(response).to redirect_to(products_url)
    end
  end

end
