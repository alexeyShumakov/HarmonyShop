class ProductsColorsController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  after_action :verify_authorized, except: [:show]
  before_action :set_products_color, only: [:show, :edit, :update, :destroy]

  # GET /products_colors
  # GET /products_colors.json
  def index
    @products_colors = ProductsColor.all
    authorize ProductsColor
  end

  # GET /products_colors/1
  # GET /products_colors/1.json
  def show
    session.delete(:size)
    @products_color = ProductsColor.find(params[:id])
    @product = @products_color.product
    respond_to do |format|
      if @products_color.images.present?
        format.js {}
      else
        format.js { render 'products_colors/no_images' }
      end
      format.html
    end
  end

  # GET /products_colors/new
  def new
    @products_color = ProductsColor.new
    authorize @products_color
  end

  # GET /products_colors/1/edit
  def edit
    authorize @products_color
  end

  # POST /products_colors
  # POST /products_colors.json
  def create
    @products_color = ProductsColor.new(products_color_params)
    authorize @products_color

    respond_to do |format|
      if @products_color.save
        format.html { redirect_to products_path, notice: 'Products color was successfully created.' }
        format.json { render :show, status: :created, location: @products_color }
      else
        format.html { render :new }
        format.json { render json: @products_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products_colors/1
  # PATCH/PUT /products_colors/1.json
  def update
    authorize @products_color
    respond_to do |format|
      if @products_color.update(products_color_params)
        format.html { redirect_to products_path, notice: 'Products color was successfully updated.' }
        format.json { render :show, status: :ok, location: @products_color }
      else
        format.html { render :edit }
        format.json { render json: @products_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products_colors/1
  # DELETE /products_colors/1.json
  def destroy
    authorize @products_color
    @products_color.destroy
    respond_to do |format|
      format.html { redirect_to products_colors_url, notice: 'Products color was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_products_color
      @products_color = ProductsColor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def products_color_params
      params.require(:products_color).permit(:size_ids =>[] )
    end
end
