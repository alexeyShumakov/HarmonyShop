require 'rails_helper'
require 'rack/test'



RSpec.describe ImagesController, type: :controller do
  login_admin

  # This should return the minimal set of attributes required to create a valid
  # Image. As you add validations to Image, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {name: nil, photo: Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/default_product_average.png', 'image/png'), products_color_id: 1}
  }
  let(:products_colors_attributes) {
    {product_id: 1, color_id: 1}
  }

  let(:invalid_attributes) {
    {name: nil, photo: nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ImagesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all images as @images" do
      products_color = ProductsColor.create! products_colors_attributes
      image = Image.create! valid_attributes
      get :index, {products_color_id: products_color.id}, valid_session
      expect(assigns(:images)).to eq([image])
    end
  end

  describe "GET #show" do
    it "assigns the requested image as @image" do
      products_color = ProductsColor.create! products_colors_attributes
      image = Image.create! valid_attributes
      get :show, {id:  image.to_param, products_color_id: products_color.id }, valid_session
      expect(assigns(:image)).to eq(image)
    end
  end

  describe "GET #new" do
    it "assigns a new image as @image" do
      products_color = ProductsColor.create! products_colors_attributes
      get :new, {products_color_id: products_color.id}, valid_session
      expect(assigns(:image)).to be_a_new(Image)
    end
  end

  describe "GET #edit" do
    it "assigns the requested image as @image" do
      products_color = ProductsColor.create! products_colors_attributes
      image = Image.create! valid_attributes
      get :edit, {id:image.to_param, products_color_id: products_color.id}, valid_session
      expect(assigns(:image)).to eq(image)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Image" do
        products_color = ProductsColor.create! products_colors_attributes
        expect {
          post :create, {:products_color_id => products_color.id, :image => valid_attributes}, valid_session
        }.to change(Image, :count).by(1)
      end

      it "assigns a newly created image as @image" do
        products_color = ProductsColor.create! products_colors_attributes
        post :create, {:products_color_id => products_color.id, :image => valid_attributes}, valid_session
        expect(assigns(:image)).to be_a(Image)
        expect(assigns(:image)).to be_persisted
      end

      it "redirects to the products index" do
        products_color = ProductsColor.create! products_colors_attributes
        post :create, {:products_color_id => products_color.id, :image => valid_attributes}, valid_session
        expect(response).to redirect_to(products_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved image as @image" do
        products_color = ProductsColor.create! products_colors_attributes
        post :create, {:products_color_id => products_color.id, :image => invalid_attributes}, valid_session
        expect(assigns(:image)).to be_a_new(Image)
      end

      it "re-renders the 'new' template" do
        products_color = ProductsColor.create! products_colors_attributes
        post :create, {:products_color_id => products_color.id, :image => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: 'name',
         photo: Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/default_product_average.png', 'image/png'),
         products_color_id: 2
        }
      }

      it "updates the requested image" do
        image = Image.create! valid_attributes
        products_color = ProductsColor.create! products_colors_attributes
        put :update, {:products_color_id => products_color.id,
                      :id => image.to_param,
                      :image => new_attributes}, valid_session
        image.reload
        expect(assigns(:image)).to eq(image)
        puts image.name
      end

      it "assigns the requested image as @image" do
        image = Image.create! valid_attributes
        products_color = ProductsColor.create! products_colors_attributes
        put :update, {:products_color_id => products_color.id,
                      :id => image.to_param,
                      :image => valid_attributes}, valid_session
        expect(assigns(:image)).to eq(image)
      end

      it "redirects to products path" do
        image = Image.create! valid_attributes
        products_color = ProductsColor.create! products_colors_attributes
        put :update, {:products_color_id => products_color.id,
                      :id => image.to_param,
                      :image => valid_attributes}, valid_session
        expect(response).to redirect_to(products_path)
      end
    end

    context "with invalid params" do
      it "assigns the image as @image" do
        image = Image.create! valid_attributes
        products_color = ProductsColor.create! products_colors_attributes
        put :update, {:products_color_id => products_color.id,
                      :id => image.to_param,
                      :image => invalid_attributes}, valid_session
        expect(assigns(:image)).to eq(image)
      end

      it "re-renders the 'edit' template" do
        image = Image.create! valid_attributes
        products_color = ProductsColor.create! products_colors_attributes
        put :update, {:products_color_id => products_color.id,
                      :id => image.to_param,
                      :image => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested image" do
      image = Image.create! valid_attributes
      products_color = ProductsColor.create! products_colors_attributes
      expect {
        delete :destroy, {:products_color_id => products_color.id,
                          :id => image.to_param}, valid_session
      }.to change(Image, :count).by(-1)
    end

    it "redirects to the images list" do
      image = Image.create! valid_attributes
      products_color = ProductsColor.create! products_colors_attributes
      delete :destroy, {:products_color_id => products_color.id,
                        :id => image.to_param}, valid_session
      expect(response).to redirect_to(products_path)
    end
  end

end
