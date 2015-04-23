require 'rails_helper'
RSpec.describe SizeHelpersController, type: :controller do
  login_admin

  let(:valid_attributes) {
    attributes_for(:size_helper)
  }

  let(:invalid_attributes) {
    attributes_for(:invalid_size_helper)
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all size_helpers as @size_helpers" do
      size_helper = SizeHelper.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:size_helpers)).to eq([size_helper])
    end
  end

  describe "GET #show" do
    it "assigns the requested size_helper as @size_helper" do
      size_helper = SizeHelper.create! valid_attributes
      get :show, {:id => size_helper.to_param}, valid_session
      expect(assigns(:size_helper)).to eq(size_helper)
    end
  end

  describe "GET #new" do
    it "assigns a new size_helper as @size_helper" do
      get :new, {}, valid_session
      expect(assigns(:size_helper)).to be_a_new(SizeHelper)
    end
  end

  describe "GET #edit" do
    it "assigns the requested size_helper as @size_helper" do
      size_helper = SizeHelper.create! valid_attributes
      get :edit, {:id => size_helper.to_param}, valid_session
      expect(assigns(:size_helper)).to eq(size_helper)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new SizeHelper" do
        expect {
          post :create, {:size_helper => valid_attributes}, valid_session
        }.to change(SizeHelper, :count).by(1)
      end

      it "assigns a newly created size_helper as @size_helper" do
        post :create, {:size_helper => valid_attributes}, valid_session
        expect(assigns(:size_helper)).to be_a(SizeHelper)
        expect(assigns(:size_helper)).to be_persisted
      end

      it "redirects to the created size_helper" do
        post :create, {:size_helper => valid_attributes}, valid_session
        expect(response).to redirect_to(SizeHelper.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved size_helper as @size_helper" do
        post :create, {:size_helper => invalid_attributes}, valid_session
        expect(assigns(:size_helper)).to be_a_new(SizeHelper)
      end

      it "re-renders the 'new' template" do
        post :create, {:size_helper => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:new_size_helper)
      }

      it "updates the requested size_helper" do
        size_helper = SizeHelper.create! valid_attributes
        put :update, {:id => size_helper.to_param, :size_helper => new_attributes}, valid_session
        size_helper.reload
        expect(size_helper.body).to eq(new_attributes[:body])
      end

      it "assigns the requested size_helper as @size_helper" do
        size_helper = SizeHelper.create! valid_attributes
        put :update, {:id => size_helper.to_param, :size_helper => valid_attributes}, valid_session
        expect(assigns(:size_helper)).to eq(size_helper)
      end

      it "redirects to the size_helper" do
        size_helper = SizeHelper.create! valid_attributes
        put :update, {:id => size_helper.to_param, :size_helper => valid_attributes}, valid_session
        expect(response).to redirect_to(size_helper)
      end
    end

    context "with invalid params" do
      it "assigns the size_helper as @size_helper" do
        size_helper = SizeHelper.create! valid_attributes
        put :update, {:id => size_helper.to_param, :size_helper => invalid_attributes}, valid_session
        expect(assigns(:size_helper)).to eq(size_helper)
      end

      it "re-renders the 'edit' template" do
        size_helper = SizeHelper.create! valid_attributes
        put :update, {:id => size_helper.to_param, :size_helper => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested size_helper" do
      size_helper = SizeHelper.create! valid_attributes
      expect {
        delete :destroy, {:id => size_helper.to_param}, valid_session
      }.to change(SizeHelper, :count).by(-1)
    end

    it "redirects to the size_helpers list" do
      size_helper = SizeHelper.create! valid_attributes
      delete :destroy, {:id => size_helper.to_param}, valid_session
      expect(response).to redirect_to(size_helpers_url)
    end
  end

end
