require 'rails_helper'
RSpec.describe ServicesGroupsController, type: :controller do
  login_admin

  # This should return the minimal set of attributes required to create a valid
  # ServicesGroup. As you add validations to ServicesGroup, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:services_group)
  }

  let(:invalid_attributes) {
    attributes_for(:invalid_services_group)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ServicesGroupsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all services_groups as @services_groups" do
      services_group = ServicesGroup.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:services_groups)).to eq([services_group])
    end
  end

  describe "GET #show" do
    it "assigns the requested services_group as @services_group" do
      services_group = ServicesGroup.create! valid_attributes
      get :show, {:id => services_group.to_param}, valid_session
      expect(assigns(:services_group)).to eq(services_group)
    end
  end

  describe "GET #new" do
    it "assigns a new services_group as @services_group" do
      get :new, {}, valid_session
      expect(assigns(:services_group)).to be_a_new(ServicesGroup)
    end
  end

  describe "GET #edit" do
    it "assigns the requested services_group as @services_group" do
      services_group = ServicesGroup.create! valid_attributes
      get :edit, {:id => services_group.to_param}, valid_session
      expect(assigns(:services_group)).to eq(services_group)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ServicesGroup" do
        expect {
          post :create, {:services_group => valid_attributes}, valid_session
        }.to change(ServicesGroup, :count).by(1)
      end

      it "assigns a newly created services_group as @services_group" do
        post :create, {:services_group => valid_attributes}, valid_session
        expect(assigns(:services_group)).to be_a(ServicesGroup)
        expect(assigns(:services_group)).to be_persisted
      end

      it "redirects to the created services_group" do
        post :create, {:services_group => valid_attributes}, valid_session
        expect(response).to redirect_to(ServicesGroup.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved services_group as @services_group" do
        post :create, {:services_group => invalid_attributes}, valid_session
        expect(assigns(:services_group)).to be_a_new(ServicesGroup)
      end

      it "re-renders the 'new' template" do
        post :create, {:services_group => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:new_services_group)
      }

      it "updates the requested services_group" do
        services_group = ServicesGroup.create! valid_attributes
        put :update, {:id => services_group.to_param, :services_group => new_attributes}, valid_session
        services_group.reload
        expect(services_group.title).to eq(new_attributes[:title])
      end

      it "assigns the requested services_group as @services_group" do
        services_group = ServicesGroup.create! valid_attributes
        put :update, {:id => services_group.to_param, :services_group => valid_attributes}, valid_session
        expect(assigns(:services_group)).to eq(services_group)
      end

      it "redirects to the services_group" do
        services_group = ServicesGroup.create! valid_attributes
        put :update, {:id => services_group.to_param, :services_group => valid_attributes}, valid_session
        expect(response).to redirect_to(services_group)
      end
    end

    context "with invalid params" do
      it "assigns the services_group as @services_group" do
        services_group = ServicesGroup.create! valid_attributes
        put :update, {:id => services_group.to_param, :services_group => invalid_attributes}, valid_session
        expect(assigns(:services_group)).to eq(services_group)
      end

      it "re-renders the 'edit' template" do
        services_group = ServicesGroup.create! valid_attributes
        put :update, {:id => services_group.to_param, :services_group => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested services_group" do
      services_group = ServicesGroup.create! valid_attributes
      expect {
        delete :destroy, {:id => services_group.to_param}, valid_session
      }.to change(ServicesGroup, :count).by(-1)
    end

    it "redirects to the services_groups list" do
      services_group = ServicesGroup.create! valid_attributes
      delete :destroy, {:id => services_group.to_param}, valid_session
      expect(response).to redirect_to(services_groups_url)
    end
  end

end
