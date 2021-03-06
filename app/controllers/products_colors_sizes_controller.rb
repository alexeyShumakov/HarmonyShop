class ProductsColorsSizesController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  after_action :verify_authorized, except: [:show]
  before_action :set_products_colors_size, only: [:show, :edit, :update, :destroy]

  # GET /products_colors_sizes
  # GET /products_colors_sizes.json
  def index
    @products_colors_sizes = ProductsColorsSize.all
    authorize ProductsColorsSize
  end

  # GET /products_colors_sizes/1
  # GET /products_colors_sizes/1.json
  def show
    session[:size] = @products_colors_size.size.code

    @products_color = @products_colors_size.products_color
    # TODO testing
    respond_to do |format|
      format.js
      if user_signed_in?
        format.html {authorize @products_colors_size}
      else
        format.html {authenticate_user!}
      end
    end
  end

  # GET /products_colors_sizes/new
  def new
    @products_colors_size = ProductsColorsSize.new
    authorize @products_colors_size
  end

  # GET /products_colors_sizes/1/edit
  def edit
    authorize @products_colors_size
  end

  # POST /products_colors_sizes
  # POST /products_colors_sizes.json
  def create
    @products_colors_size = ProductsColorsSize.new(products_colors_size_params)
    authorize @products_colors_size

    respond_to do |format|
      if @products_colors_size.save
        format.html { redirect_to products_path, notice: 'Products colors size was successfully created.' }
        format.json { render :show, status: :created, location: @products_colors_size }
      else
        format.html { render :new }
        format.json { render json: @products_colors_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products_colors_sizes/1
  # PATCH/PUT /products_colors_sizes/1.json
  def update
    authorize @products_colors_size
    respond_to do |format|
      if @products_colors_size.update(products_colors_size_params)
        format.html { redirect_to products_path, notice: 'Products colors size was successfully updated.' }
        format.json { render :show, status: :ok, location: @products_colors_size }
      else
        format.html { render :edit }
        format.json { render json: @products_colors_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products_colors_sizes/1
  # DELETE /products_colors_sizes/1.json
  def destroy
    authorize @products_colors_size
    @products_colors_size.destroy
    respond_to do |format|
      format.html { redirect_to products_colors_sizes_url, notice: 'Products colors size was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_products_colors_size
      @products_colors_size = ProductsColorsSize.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def products_colors_size_params
      params.require(:products_colors_size).permit(:warehouse, :products_color_id, :size_id)
    end
end
