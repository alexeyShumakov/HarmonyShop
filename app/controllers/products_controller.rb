class ProductsController < ApplicationController
  before_action :current_user_admin?, except: [:show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  after_action :assign_product_to_branch_category, only: [:create, :edit, :update]
  # GET /products
  # GET /products.json
  def index
    @products = Product.all.page(params[:page]).per(10)
  end

  def search
    set_cookies
    @products = Product.search do
      fulltext params[:search] do
        fields(:title)
      end

      paginate page: params[:page], per_page: cookies[:page_size]
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    session.delete(:size)
    if params.has_key?(:color_id)
      @current_color = @product.products_colors.find_by_color_id(params[:color_id])
      @current_color = @product.products_colors.first unless @current_color
    else
      @current_color = @product.products_colors.first
    end

  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to  products_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_path, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def assign_product_to_branch_category
      @product.assign_to_branch
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :leaf_category_id, :article, :size_helper_id, :color_ids => [])
    end
end
