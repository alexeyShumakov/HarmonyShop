class CategoriesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  after_action :verify_authorized, except: [:index, :show]
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :set_cookies, only: [:show]

  # GET /categories
  # GET /categories.json
  def index
    @products = Product.first(21)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
      @cat_products = @category.products.page(params[:page]).per(cookies[:page_size])
  end

  # GET /categories/new
  def new
    @category = Category.new
    authorize @category
  end

  # GET /categories/1/edit
  def edit
    authorize @category
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    authorize @category
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    authorize @category
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    authorize @category
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
      @current_category = @category
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :parent_id, :children_count, :page_title, :description)
    end
end
