require 'rails_helper'


RSpec.describe SizesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Size. As you add validations to Size, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {name: '23', code: '23'}
  }

  let(:invalid_attributes) {
    {name: nil, code: nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SizesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all sizes as @sizes" do
      size = Size.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:sizes)).to eq([size])
    end
  end

  describe "GET #show" do
    it "assigns the requested size as @size" do
      size = Size.create! valid_attributes
      get :show, {:id => size.to_param}, valid_session
      expect(assigns(:size)).to eq(size)
    end
  end

  describe "GET #new" do
    it "assigns a new size as @size" do
      get :new, {}, valid_session
      expect(assigns(:size)).to be_a_new(Size)
    end
  end

  describe "GET #edit" do
    it "assigns the requested size as @size" do
      size = Size.create! valid_attributes
      get :edit, {:id => size.to_param}, valid_session
      expect(assigns(:size)).to eq(size)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Size" do
        expect {
          post :create, {:size => valid_attributes}, valid_session
        }.to change(Size, :count).by(1)
      end

      it "assigns a newly created size as @size" do
        post :create, {:size => valid_attributes}, valid_session
        expect(assigns(:size)).to be_a(Size)
        expect(assigns(:size)).to be_persisted
      end

      it "redirects to the created size" do
        post :create, {:size => valid_attributes}, valid_session
        expect(response).to redirect_to(Size.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved size as @size" do
        post :create, {:size => invalid_attributes}, valid_session
        expect(assigns(:size)).to be_a_new(Size)
      end

      it "re-renders the 'new' template" do
        post :create, {:size => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {code: '10', name: '10'}
      }

      it "updates the requested size" do
        size = Size.create! valid_attributes
        put :update, {:id => size.to_param, :size => new_attributes}, valid_session
        size.reload
        expect(assigns(:size)).to eq(size)
      end

      it "assigns the requested size as @size" do
        size = Size.create! valid_attributes
        put :update, {:id => size.to_param, :size => valid_attributes}, valid_session
        expect(assigns(:size)).to eq(size)
      end

      it "redirects to the size" do
        size = Size.create! valid_attributes
        put :update, {:id => size.to_param, :size => valid_attributes}, valid_session
        expect(response).to redirect_to(size)
      end
    end

    context "with invalid params" do
      it "assigns the size as @size" do
        size = Size.create! valid_attributes
        put :update, {:id => size.to_param, :size => invalid_attributes}, valid_session
        expect(assigns(:size)).to eq(size)
      end

      it "re-renders the 'edit' template" do
        size = Size.create! valid_attributes
        put :update, {:id => size.to_param, :size => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested size" do
      size = Size.create! valid_attributes
      expect {
        delete :destroy, {:id => size.to_param}, valid_session
      }.to change(Size, :count).by(-1)
    end

    it "redirects to the sizes list" do
      size = Size.create! valid_attributes
      delete :destroy, {:id => size.to_param}, valid_session
      expect(response).to redirect_to(sizes_url)
    end
  end

end
