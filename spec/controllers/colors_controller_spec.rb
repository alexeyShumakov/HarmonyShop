require 'rails_helper'

RSpec.describe ColorsController, type: :controller do
  login_admin

  # This should return the minimal set of attributes required to create a valid
  # Color. As you add validations to Color, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {name: 'red', code: 'red'}
  }

  let(:invalid_attributes) {
    {name: nil, code: nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ColorsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all colors as @colors" do
      color = Color.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:colors)).to eq([color])
    end
  end

  describe "GET #show" do
    it "assigns the requested color as @color" do
      color = Color.create! valid_attributes
      get :show, {:id => color.to_param}, valid_session
      expect(assigns(:color)).to eq(color)
    end
  end

  describe "GET #new" do
    it "assigns a new color as @color" do
      get :new, {}, valid_session
      expect(assigns(:color)).to be_a_new(Color)
    end
  end

  describe "GET #edit" do
    it "assigns the requested color as @color" do
      color = Color.create! valid_attributes
      get :edit, {:id => color.to_param}, valid_session
      expect(assigns(:color)).to eq(color)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Color" do
        expect {
          post :create, {:color => valid_attributes}, valid_session
        }.to change(Color, :count).by(1)
      end

      it "assigns a newly created color as @color" do
        post :create, {:color => valid_attributes}, valid_session
        expect(assigns(:color)).to be_a(Color)
        expect(assigns(:color)).to be_persisted
      end

      it "redirects to the created color" do
        post :create, {:color => valid_attributes}, valid_session
        expect(response).to redirect_to(Color.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved color as @color" do
        post :create, {:color => invalid_attributes}, valid_session
        expect(assigns(:color)).to be_a_new(Color)
      end

      it "re-renders the 'new' template" do
        post :create, {:color => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {color: 'new color', code: 'color'}
      }

      it "updates the requested color" do
        color = Color.create! valid_attributes
        put :update, {:id => color.to_param, :color => new_attributes}, valid_session
        color.reload
        expect(assigns(:color)).to eq(color)
      end

      it "assigns the requested color as @color" do
        color = Color.create! valid_attributes
        put :update, {:id => color.to_param, :color => valid_attributes}, valid_session
        expect(assigns(:color)).to eq(color)
      end

      it "redirects to the color" do
        color = Color.create! valid_attributes
        put :update, {:id => color.to_param, :color => valid_attributes}, valid_session
        expect(response).to redirect_to(color)
      end
    end

    context "with invalid params" do
      it "assigns the color as @color" do
        color = Color.create! valid_attributes
        put :update, {:id => color.to_param, :color => invalid_attributes}, valid_session
        expect(assigns(:color)).to eq(color)
      end

      it "re-renders the 'edit' template" do
        color = Color.create! valid_attributes
        put :update, {:id => color.to_param, :color => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested color" do
      color = Color.create! valid_attributes
      expect {
        delete :destroy, {:id => color.to_param}, valid_session
      }.to change(Color, :count).by(-1)
    end

    it "redirects to the colors list" do
      color = Color.create! valid_attributes
      delete :destroy, {:id => color.to_param}, valid_session
      expect(response).to redirect_to(colors_url)
    end
  end

end
