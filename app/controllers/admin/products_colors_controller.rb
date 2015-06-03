class Admin::ProductsColorsController < Admin::AdminController
  layout 'admin'
  before_action :set_admin_products_color, only: [:show, :edit, :update, :destroy]

  # GET /admin/products_colors
  # GET /admin/products_colors.json
  def index
    @admin_products_colors = ProductsColor.all
  end

  # GET /admin/products_colors/1
  # GET /admin/products_colors/1.json
  def show
  end

  # GET /admin/products_colors/new
  def new
    @admin_products_color = ProductsColor.new
  end

  # GET /admin/products_colors/1/edit
  def edit
  end

  # POST /admin/products_colors
  # POST /admin/products_colors.json
  def create
    @admin_products_color = ProductsColor.new(admin_products_color_params)

    respond_to do |format|
      if @admin_products_color.save
        format.html { redirect_to @admin_products_color, notice: 'Products color was successfully created.' }
        format.json { render :show, status: :created, location: @admin_products_color }
      else
        format.html { render :new }
        format.json { render json: @admin_products_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/products_colors/1
  # PATCH/PUT /admin/products_colors/1.json
  def update
    respond_to do |format|
      if @admin_products_color.update(admin_products_color_params)
        format.html { redirect_to admin_products_path, notice: 'Products color was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_products_color }
      else
        format.html { render :edit }
        format.json { render json: @admin_products_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/products_colors/1
  # DELETE /admin/products_colors/1.json
  def destroy
    @admin_products_color.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_path, notice: 'Products color was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_products_color
      @admin_products_color = ProductsColor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_products_color_params
      params.require(:products_color).permit(:size_ids =>[] )
    end
end
