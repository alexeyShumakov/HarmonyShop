require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
	login_admin

	describe 'GET #index' do

		it 'return products' do
			product = create(:product)
			get :index, {}
			expect(assigns(:products)).to eq([product])
		end
	end

	describe 'GET #show' do

		it 'return products' do
			product = create(:product)
			category = create(:category)
			category.products << product
			get :show, {id: category.to_param}
			expect(assigns(:cat_products)).to eq(category.products)
		end
	end

	describe 'GET #new' do

		it 'assigns new category as @category' do
			get :new, {}
			expect(assigns(:category)).to be_a_new(Category)
		end
	end

	describe 'GET #edit' do

		it 'assigns the requested category as @category' do
			category = create(:category)
			get :edit, {id: category.to_param}
			expect(assigns(:category)).to eq(category)
		end
	end

	describe 'POST #create' do

		context 'with valid params' do
			it 'create new product' do
				expect{
					post :create, {category: attributes_for(:category)}
				}.to change(Category, :count).by(1)
			end
		end

	end
end
